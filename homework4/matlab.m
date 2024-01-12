clear, clc
file_id=fopen('C:\Users\EMREYILDIZ\Desktop\Verilog Homeworks\homework4\homework4.sim\sim_1\behav\xsim\matlab_new_out.txt', 'w');
x =zeros(32,32);
feedback =zeros(32,1);
for i=1:32
x(i,:) = de2bi(12345*i,32);
end
for i= 1:200
    for j= 1:32
        feedback(j) = xor(xor( xor(x(j, 32), x(j, 31)), x(j, 12)), x(j, 1));
    end
    x = [x(:,2:32),feedback];
    output = x(:,1);
    for j=length(output):-1:1
        fprintf(file_id,strcat(num2str(output(j))));
    end
    fprintf(file_id,'\r\n');
end