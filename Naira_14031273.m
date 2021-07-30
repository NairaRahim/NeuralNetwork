filename = 'breast-cancer-wisconsin.data';
M = csvread(filename);
newoutput=zeros(209,2); %for 30% data
newoutput2=zeros(489,2); %for 70% data

trainpercent7=(70/100)*699;
disp(trainpercent7)
trainpercent3=trainpercent7+((30/100)*699);
disp(trainpercent3)
inputseventy=M((1:trainpercent7),(2:10));
inputthirty=M(((trainpercent7+1):trainpercent3),(2:10));
outputseventy=M((1:trainpercent7),11);
outputthirty=M(((trainpercent7+1):trainpercent3),11);
outputthirty2=M(((trainpercent7+1):trainpercent3),11);
outputseventy2=M((1:trainpercent7),11);

net = newff(inputseventy',outputseventy',20, {'tansig' 'tansig'}, 'trainr', 'learngd', 'mse');
net.trainParam.goal = 0.01;
net.trainParam.epochs = 100;
net = train(net, inputseventy',outputseventy');
output1=net(inputthirty');


%round(output1)
count2=0;
count4=0;

%this is the new matrix which is our expected output of train data
for j=1:209
    if outputthirty2(j)==2
        newoutput(j,1)=1;
    end
    if outputthirty2(j)==4
        newoutput(j,2)=1;
    end
end




%this is the new matrix which is our expected output of test data
for j=1:489
    if outputseventy2(j)==2
        newoutput2(j,1)=1;
    end
    if outputseventy2(j)==4
        newoutput2(j,2)=1;
    end
end

%rounding off output matrix of test data having 2 and 4
for i=1:209
    if(output1(i)<=3.4)
        count2=count2+1;
        output1(i)=2;
    else
        count4=count4+1;
        output1(i)=4;
    end  
end
accuracy=minus(outputthirty,output1');
zero=0;
for i=1:209
   if(accuracy(i)==0)
       zero=zero+1;
   end
end
disp('accuracy when train data =70% and rest is test data and output matrix has 2 and 4 and hidden layers are 20')
disp((zero/209)*100)


%this is training of 0 ,1 matrix
net = newff(inputseventy',newoutput2',20, {'tansig' 'tansig'}, 'trainr', 'learngd', 'mse');
net.trainParam.goal = 0.01;
net.trainParam.epochs = 100;
net = train(net, inputseventy',newoutput2');
out2=net(inputthirty');
[Y,I]=max(out2);

final=zeros(209,2);
for i=1:209
    if(I(i)==1)
        final(i,1)=1;
    else 
        final(i,2)=1;
    end
end

accuracy2=minus(newoutput,final);
countz=0;
for i=1:209
    if(accuracy2(i,1)==0 && accuracy2(i,2)==0)
        countz=countz+1;
    end
end
disp('accuracy when train data=70% and output matrix has 1, 0 and hidden layers are 20')
disp((countz/209)*100)


filename = 'breast-cancer-wisconsin.data';
S = csvread(filename);
%train 90%

% newoutput=zeros(69,2); %for 10% data
% newoutput2=zeros(629,2); %for 90% data
% 
% trainpercent9=(90/100)*699;
% disp(trainpercent9)
% trainpercent1=trainpercent9+((10/100)*699);
% disp(trainpercent1)
% inputseventy=S((1:trainpercent9),(2:10));
% inputthirty=S(((trainpercent9+1):trainpercent1),(2:10));
% outputseventy=S((1:trainpercent9),11);
% outputthirty=S(((trainpercent9+1):trainpercent1),11);
% outputthirty2=S(((trainpercent9+1):trainpercent1),11);
% outputseventy2=S((1:trainpercent9),11);
% 
% net = newff(inputseventy',outputseventy',20, {'tansig' 'tansig'}, 'trainr', 'learngd', 'mse');
% net.trainParam.goal = 0.01;
% net.trainParam.epochs = 100;
% net = train(net, inputseventy',outputseventy');
% output1=net(inputthirty');
% 
% 
% %round(output1)
% count2=0;
% count4=0;
% 
% %this is the new matrix which is our expected output of train data
% for j=1:69
%     if outputthirty2(j)==2
%         newoutput(j,1)=1;
%     end
%     if outputthirty2(j)==4
%         newoutput(j,2)=1;
%     end
% end
% 
% 
% 
% 
% %this is the new matrix which is our expected output of test data
% for j=1:629
%     if outputseventy2(j)==2
%         newoutput2(j,1)=1;
%     end
%     if outputseventy2(j)==4
%         newoutput2(j,2)=1;
%     end
% end
% 
% %rounding off output matrix of test data having 2 and 4
% for i=1:69
%     if(output1(i)<=3.4)
%         count2=count2+1;
%         output1(i)=2;
%     else
%         count4=count4+1;
%         output1(i)=4;
%     end  
% end
% accuracy=minus(outputthirty,output1');
% zero=0;
% for i=1:69
%    if(accuracy(i)==0)
%        zero=zero+1;
%    end
% end
% disp('accuracy when train data =90% and rest is test data and output matrix has 2 and 4 and hidden layers are 20')
% disp((zero/69)*100)
% 
% 
% %this is training of 0 ,1 matrix
% net = newff(inputseventy',newoutput2',20, {'tansig' 'tansig'}, 'trainr', 'learngd', 'mse');
% net.trainParam.goal = 0.01;
% net.trainParam.epochs = 100;
% net = train(net, inputseventy',newoutput2');
% out2=net(inputthirty');
% [Y,I]=max(out2);
% 
% final=zeros(69,2);
% for i=1:69
%     if(I(i)==1)
%         final(i,1)=1;
%     else 
%         final(i,2)=1;
%     end
% end
% 
% accuracy2=minus(newoutput,final);
% countz=0;
% for i=1:69
%     if(accuracy2(i,1)==0 && accuracy2(i,2)==0)
%         countz=countz+1;
%     end
% end
% disp('accuracy when train data=90% and output matrix has 1, 0 and hidden layers are 20')
% disp((countz/69)*100)
% 




 %train 70%
 
 newoutput=zeros(209,2); %for 30% data
 newoutput2=zeros(489,2); %for 70% data
 
 trainpercent7=(70/100)*699;
 disp(trainpercent7)
 trainpercent3=trainpercent7+((30/100)*699);
 disp(trainpercent3)
 inputseventy=S((1:trainpercent7),(2:10));
 inputthirty=S(((trainpercent7+1):trainpercent3),(2:10));
 outputseventy=S((1:trainpercent7),11);
 outputthirty=S(((trainpercent7+1):trainpercent3),11);
 outputthirty2=S(((trainpercent7+1):trainpercent3),11);
 outputseventy2=S((1:trainpercent7),11);
 
 net = newff(inputseventy',outputseventy',30, {'tansig' 'tansig'}, 'trainr', 'learngd', 'mse');
 net.trainParam.goal = 0.01;
 net.trainParam.epochs = 100;
 net = train(net, inputseventy',outputseventy');
 output1=net(inputthirty');
 
 
 %round(output1)
 count2=0;
 count4=0;
 
 %this is the new matrix which is our expected output of train data
 for j=1:209
     if outputthirty2(j)==2
         newoutput(j,1)=1;
     end
     if outputthirty2(j)==4
         newoutput(j,2)=1;
     end
 end
 
 
 
 
 %this is the new matrix which is our expected output of test data
 for j=1:489
     if outputseventy2(j)==2
         newoutput2(j,1)=1;
     end
     if outputseventy2(j)==4
         newoutput2(j,2)=1;
     end
 end
 
 %rounding off output matrix of test data having 2 and 4
 for i=1:209
     if(output1(i)<=3.4)
         count2=count2+1;
         output1(i)=2;
     else
         count4=count4+1;
         output1(i)=4;
     end  
 end
 accuracy=minus(outputthirty,output1');
 zero=0;
 for i=1:209
    if(accuracy(i)==0)
        zero=zero+1;
    end
 end
 disp('accuracy when train data =70% and rest is test data and output matrix has 2 and 4 and hidden layers are 30')
 disp((zero/209)*100)
 
 
 %this is training of 0 ,1 matrix
 net = newff(inputseventy',newoutput2',30, {'tansig' 'tansig'}, 'trainr', 'learngd', 'mse');
 net.trainParam.goal = 0.01;
 net.trainParam.epochs = 100;
 net = train(net, inputseventy',newoutput2');
 out2=net(inputthirty');
 [Y,I]=max(out2);
 
 final=zeros(209,2);

for i=1:209
     if(I(i)==1)
         final(i,1)=1;
     else 
         final(i,2)=1;
     end
 end
 
 accuracy2=minus(newoutput,final);
 countz=0;
 for i=1:209
     if(accuracy2(i,1)==0 && accuracy2(i,2)==0)
         countz=countz+1;
     end
 end
 disp('accuracy when train data=70% and output matrix has 1, 0 and hidden layers are 30')
 disp((countz/209)*100)


% %train 60
% 
% newoutput=zeros(279,2); %for 40% data
% newoutput2=zeros(419,2); %for 60% data
% 
% trainpercent6=(60/100)*699;
% disp(trainpercent6)
% trainpercent4=trainpercent6+((40/100)*699);
% disp(trainpercent4)
% inputseventy=S((1:trainpercent6),(2:10));
% inputthirty=S(((trainpercent6+1):trainpercent4),(2:10));
% outputseventy=S((1:trainpercent6),11);
% outputthirty=S(((trainpercent6+1):trainpercent4),11);
% outputthirty2=S(((trainpercent6+1):trainpercent4),11);
% outputseventy2=S((1:trainpercent6),11);
% 
% net = newff(inputseventy',outputseventy',20, {'tansig' 'tansig'}, 'trainr', 'learngd', 'mse');
% net.trainParam.goal = 0.01;
% net.trainParam.epochs = 100;
% net = train(net, inputseventy',outputseventy');
% output1=net(inputthirty');
% 
% 
% %round(output1)
% count2=0;
% count4=0;
% 
% %this is the new matrix which is our expected output of train data
% for j=1:279
%     if outputthirty2(j)==2
%         newoutput(j,1)=1;
%     end
%     if outputthirty2(j)==4
%         newoutput(j,2)=1;
%     end
% end
% 
% 
% 
% 
% %this is the new matrix which is our expected output of test data
% for j=1:419
%     if outputseventy2(j)==2
%         newoutput2(j,1)=1;
%     end
%     if outputseventy2(j)==4
%         newoutput2(j,2)=1;
%     end
% end
% 
% %rounding off output matrix of test data having 2 and 4
% for i=1:279
%     if(output1(i)<=3.4)
%         count2=count2+1;
%         output1(i)=2;
%     else
%         count4=count4+1;
%         output1(i)=4;
%     end  
% end
% accuracy=minus(outputthirty,output1');
% zero=0;
% for i=1:279
%    if(accuracy(i)==0)
%        zero=zero+1;
%    end
% end
% disp('accuracy when train data =60% and rest is test data and output matrix has 2 and 4 and hidden layers are 20')
% disp((zero/279)*100)
% 
% 
% %this is training of 0 ,1 matrix
% net = newff(inputseventy',newoutput2',20, {'tansig' 'tansig'}, 'trainr', 'learngd', 'mse');
% net.trainParam.goal = 0.01;
% net.trainParam.epochs = 100;
% net = train(net, inputseventy',newoutput2');
% out2=net(inputthirty');
% [Y,I]=max(out2);
% 
% final=zeros(279,2);
% for i=1:279
%     if(I(i)==1)
%         final(i,1)=1;
%     else 
%         final(i,2)=1;
%     end
% end
% 
% accuracy2=minus(newoutput,final);
% countz=0;
% for i=1:279
%     if(accuracy2(i,1)==0 && accuracy2(i,2)==0)
%         countz=countz+1;
%     end
% end
% disp('accuracy when train data=60% and output matrix has 1, 0 and hidden layers are 20')
% disp((countz/279)*100)
% 


%train 80
%newoutput=zeros(139,2); %for 20% data
%newoutput2=zeros(559,2); %for 80% data

% {disp(trainpercent8)
% trainpercent2=trainpercent8+((20/100)*699);
% disp(trainpercent2)
% inputseventy=S((1:trainpercent8),(2:10));
% inputthirty=S(((trainpercent8+1):trainpercent2),(2:10));
% outputseventy=S((1:trainpercent8),11);
% outputthirty=S(((trainpercent8+1):trainpercent2),11);
% outputthirty2=S(((trainpercent8+1):trainpercent2),11);
% outputseventy2=S((1:trainpercent8),11);
% 
% net = newff(inputseventy',outputseventy',20, {'tansig' 'tansig'}, 'trainr', 'learngd', 'mse');
% net.trainParam.goal = 0.01;
% net.trainParam.epochs = 100;
% net = train(net, inputseventy',outputseventy');
% output1=net(inputthirty');
% 
% 
% %round(output1)
% count2=0;
% count4=0;
% 
% %this is the new matrix which is our expected output of train data
% for j=1:139
%     if outputthirty2(j)==2
%         newoutput(j,1)=1;
%     end
%     if outputthirty2(j)==4
%         newoutput(j,2)=1;
%     end
% end
% 
% 
% 
% 
% %this is the new matrix which is our expected output of test data
% for j=1:559
%     if outputseventy2(j)==2
%         newoutput2(j,1)=1;
%     end
%     if outputseventy2(j)==4
%         newoutput2(j,2)=1;
%     end
% end
% 
% %rounding off output matrix of test data having 2 and 4
% for i=1:139
%     if(output1(i)<=3.4)
%         count2=count2+1;
%         output1(i)=2;
%     else
%         count4=count4+1;
%         output1(i)=4;
%     end  
% end
% accuracy=minus(outputthirty,output1');
% zero=0;
% for i=1:139
%    if(accuracy(i)==0)
%        zero=zero+1;
%    end
% end
% disp('accuracy when train data =80% and rest is test data and output matrix has 2 and 4 and hidden layers are 20')
% disp((zero/139)*100)
% 
% 
% %this is training of 0 ,1 matrix
% net = newff(inputseventy',newoutput2',20, {'tansig' 'tansig'}, 'trainr', 'learngd', 'mse');
% net.trainParam.goal = 0.01;
% net.trainParam.epochs = 100;
% net = train(net, inputseventy',newoutput2');
% out2=net(inputthirty');
% [Y,I]=max(out2);
% 
% final=zeros(139,2);
% for i=1:139
%     if(I(i)==1)
%         final(i,1)=1;
%     else 
%         final(i,2)=1;
%     end
% end
% 
% accuracy2=minus(newoutput,final);
% countz=0;
% for i=1:139
%     if(accuracy2(i,1)==0 && accuracy2(i,2)==0)
%         countz=countz+1;
%     end
% end
% disp('accuracy when train data=80% and output matrix has 1, 0 and hidden layers are 20')
% disp((countz/139)*100)

