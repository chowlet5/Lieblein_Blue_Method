

fileID = fopen('bluecoeff.txt','w');

for i=4:100
    [a,b] = bluecoeff(i);
    string = strcat(num2str(i),': [[');
    for j=1:i
        if j ~=i
            string=strcat(string,num2str(a(j),10),', ');      
        else
            string=strcat(string,num2str(a(j),10),'],[');
        end
    end
    
    for j=1:i
        if j ~=i
            string=strcat(string,num2str(b(j),10),', ');     
        else
            string=strcat(string,num2str(b(j),10),']],\n'); 
        end
    end
    fprintf(fileID,string);
end

fclose(fileID);