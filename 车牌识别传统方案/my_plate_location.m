%%
clear;
close all;
clc;
%% ��ȡͼ��
tic;
file_path =  'C:\Users\76075\Desktop\�����¿γ�\����ʶ��\MATLAB����ʶ��ϵͳ��ƣ�����\test_dataset\test_dataset\Set1\';% ͼ���ļ���·��  
img_path_list = dir(strcat(file_path,'*.jpg'));%��ȡ���ļ���������bmp��ʽ��ͼ��  
img_num = length(img_path_list);%��ȡͼ�������� 
figure(1);
xingtai = zeros(1,img_num);
yanse = zeros(1,img_num);
for j = 1:img_num %��һ��ȡͼ�� 
    
    image_name = img_path_list(j).name;% ͼ����  
    image =  imread(strcat(file_path,image_name));  
    [plate, cnt,xingtai(1,j),yanse(1,j)] = plate_location_top(image);
    if cnt ==1
     imwrite(squeeze(plate), strcat('C:\Users\76075\Desktop\�����¿γ�\����ʶ��\MATLAB����ʶ��ϵͳ��ƣ�����\plate_set1\', num2str(j),'.jpg'))
    elseif cnt>1
             for i = 1:cnt
                 imwrite(uint8(squeeze(plate(i,:,:,:))), strcat('C:\Users\76075\Desktop\�����¿γ�\����ʶ��\MATLAB����ʶ��ϵͳ��ƣ�����\plate_set1\', num2str(j),'_', num2str(i),'.jpg'))
             end
    else
        fprintf('%d  %s\n',j,'δ��������');
    end
   fprintf('%d %s\n', j, image_name);% ��ʾ���ڴ����ͼ����  
end  


toc

% bar(1:img_num, xingtai);
% bar(1:img_num, yanse);

% figure(1);
% h1 = scatter(1:img_num, xingtai, 'r*'); hold on;
% h2 = scatter(1:img_num, yanse, 'b*'); hold on;
% % ��Ȼֻ����ɫ�֣���ôֻ��ÿ����ɫ�ĵ�һ������~
% legend([h1(1),h2(1)],'��̬ͨ����', '��ɫͨ����','location', 'northwest');





