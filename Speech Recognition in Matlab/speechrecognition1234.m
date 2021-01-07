%% Speaker recognition and classification function 

function speechrecognition1234(filename)
voice = audioread (filename);
x = voice;
disp(x)
x=x';
x=x(1,:);
x=x';
y1=audioread('s1.wav');  %Rakshitha
y1=y1';
y1=y1(1,:);
y1=y1';
z1=xcorr(x,y1);
m1=max(z1);
l1=length(z1);
t1=-((l1-1)/2):1:((l1-1)/2);
t1=t1';
figure(2)
plot(t1,z1);
title('Correlation with s1.wav file');
xlabel('Index');
ylabel('Magnitude');

y2=audioread('s11.wav');     %Sriram
y2=y2';
y2=y2(1,:);
y2=y2';
z2=xcorr(x,y2);
m2=max(z2);
l2=length(z2);
t2=-((l2-1)/2):1:((l2-1)/2);
t2=t2';
figure(3)
plot(t2,z2);
title('Correlation with s11.wav file');
xlabel('Index');
ylabel('Magnitude');

y3=audioread('s13.wav');    %Shashwath
y3=y3';
y3=y3(1,:);
y3=y3';
z3=xcorr(x,y3);
m3=max(z3);
l3=length(z3);
t3=-((l3-1)/2):1:((l3-1)/2);
t3=t3';
figure(4)
plot(t3,z3);
title('Correlation with s13.wav file');
xlabel('Index');
ylabel('Magnitude');

m4=40;                    %Minimum correlation output should be 40
a=[m1 m2 m3 m4];
m=max(a);
h=audioread('allow.wav');
if m<=m1
         disp('Hello Rakshitha');
        soundsc(audioread('s1.wav'),50000)
        soundsc(h,50000)
       
elseif m<=m2
        disp('Hello Sriram');
        soundsc(audioread('s11.wav'),50000)
        soundsc(h,50000)
        
    
elseif m<=m3
        disp('Hello Shashwath');
        soundsc(audioread('s13.wav'),50000)
        soundsc(h,50000)
        
else
        disp('Access Denied');
        soundsc(audioread('denied.wav'),50000)
   
end
end