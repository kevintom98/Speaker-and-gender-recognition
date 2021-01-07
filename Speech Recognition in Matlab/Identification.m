%% Digital Signal Processing Project- Gender Identification and Classification                                    
%% Program:
%Feature Matrix
function Identification(a)
datamat=zeros(5,4);% data matrix to store features
disp('Feature Extraction');
for k=1:5
    filename=['s' num2str(k) '.wav'];
    [my2,fs] = audioread(filename);                                       %Reading the files
    [fundamental_freq,zero_crossing,short_energy]=Charac_features(my2,fs);%Finding features
    datamat(k,1)=k;                                                       %Storing features in the data matrix
    datamat(k,2)=fundamental_freq;
    datamat(k,3)=zero_crossing;
    datamat(k,4)=short_energy;
end
%% Feature Extraction and Classification
fundamental_freq_level=135;                                               %Manually fixing the value of the fundamental freq
zero_crossing_level=12;                                                   %Manually fixing the value of the zero crossing value
short_energy_level=0.5;                                                   %Manually fixing the value of the Short energy value

%Reading a file and getting the fundamental,zero crossing, short energy
%values

[my2,fs] = audioread(a);
figure(1);
plot(my2);
title('Recorded voice signal');
xlabel('Index');
ylabel('Amplitude');
[freq,zero_cross,short_ene]=Charac_features(my2,fs);

%Giving weights and finding a number for a particular obseravation

marks=0.25*(freq/fundamental_freq_level)+(zero_cross/zero_crossing_level)*0.35;
marks=marks+ (0.4*short_ene/short_energy_level)

%if value greater than 1 for that particular observation
if marks>2 
    disp('Female voice has been recognized')

else 
    disp('Male voice has been recognized')

end  
end