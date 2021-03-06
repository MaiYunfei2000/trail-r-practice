%% Homework: Roll Calling Program

% 将这个班所有学生的学号，姓名，存储在文件里（2列，n行），制作一个点名小程序。
% 功能：随机点名，点名后呈现姓名和学号；
% 点名后弹出输入框，在输入框输入出勤情况（1-出勤，0-缺勤）；
% 将当日考勤情况（日期、姓名、学号、出勤）记录在文件attendance.txt里。

% !!!CAUTION!!! Only available in version 2019a or hereafter since the script use
% functions "readmatrix()" and "writecell()" recommend by Matlab official
% site, which were updated in 2019a

%% Usage

% Makesure files initialize.m pick_name.m student_list.xls students_attendance.xls are in the same folder
% Type "initialize" first
% Then type "pick_name" to pick a student

%% Read the student ID and name list from Excel file, and generate a data list

opts = detectImportOptions('student_list.xls');
opts.SelectedVariableNames = [1:2]; 
student_roll = readmatrix('student_list.xls', opts);

%% Read the picked students data, so that subsequent pick-name process
% proceeded successfully @{pick_name.m}

students_attendance = readmatrix('students_attendance.xls');
data_size = size(students_attendance);
picked_num = data_size(1);

%% Indicating initialization completed

disp('Initilization completed.')
disp('Type "pick_name" to pick a student.')