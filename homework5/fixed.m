temperature_list=[-43.25,-42.375,-41.875,-39.875];

ra=0;
rb=0;
rc=0;
rd=0;

sum1=0;
sum2=0;
sum3=0;


averaged=[];
outputlist=zeros(1,length(temperature_list));

for i=1:1:length(temperature_list)
    
   
    
    rd=rc;
    rc=rb;
    rb=ra;
    ra=temperature_list(i);
    
   
    sum1=ra+rb;
    sum2=rc+rd;
    sum3=sum1+sum2;
    averaged=sum3/4;
    outputlist(i)=round(averaged*(2^2))/(2^2);


end    
