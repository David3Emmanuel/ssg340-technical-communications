
%% 11.5 Experiment 5: Data Structures and Cell Arrays
disp('--- 11.5 Experiment 5: Data Structures & Cell Arrays ---');

% 1 & 2: Structure array representing student data
students(1).Name = 'Abdullah';
students(1).ID = '230407018';
students(1).Marks = [85, 90, 88];

students(2).Name = 'AbdulMalik';
students(2).ID = '230407035';
students(2).Marks = [92, 88, 95];

disp('Structure Array of Students:');
for i = 1:length(students)
    fprintf('Name: %s, ID: %s, Avg Mark: %.2f\n', students(i).Name, students(i).ID, mean(students(i).Marks));
end

% 3: Cell array storing different types of data
mixed_cell = {'Systems Engineering', 2026, students(1), [1.1, 2.2, 3.3]};

% 4: Access and manipulate data in cell array
fprintf('\nAccessing Cell Array:\n');
fprintf('String data: %s\n', mixed_cell{1});
fprintf('Numeric data: %d\n', mixed_cell{2});
fprintf('Student Name from struct in cell: %s\n', mixed_cell{3}.Name);

% Modify structure field inside the cell array
mixed_cell{3}.Marks = [100, 100, 100]; 
fprintf('Modified Student Marks in cell: [%d, %d, %d]\n', mixed_cell{3}.Marks);

% 5: Call the variable argument function (defined at the end of the script)
fprintf('\nCreating structures with varargin:\n');
[dynamic_students] = create_students('Ali', 'ENG003', [70 75 80], 'Zainab', 'ENG004', [99 98 97]);
disp(dynamic_students);
for i = 1:length(dynamic_students)
    fprintf('Dynamic Student %d: %s (%s)\n', i, dynamic_students(i).Name, dynamic_students(i).ID);
end

%% Helper Function for 11.5 Task 5
% Note: In MATLAB, local functions must be placed at the end of the script file.
function [varargout] = create_students(varargin)
    % Calculates the number of students provided (3 arguments per student: Name, ID, Marks)
    num_students = nargin / 3;
    
    if mod(nargin, 3) ~= 0
        error('Inputs must be provided in multiples of 3 (Name, ID, Marks).');
    end
    
    % Use cell() to create cell arrays as requested in the hint
    names = cell(1, num_students);
    ids = cell(1, num_students);
    marks = cell(1, num_students);
    
    for k = 1:num_students
        names{k} = varargin{(k-1)*3 + 1};
        ids{k} = varargin{(k-1)*3 + 2};
        marks{k} = varargin{(k-1)*3 + 3};
    end
    
    % Use struct() and deal() to assign values to multiple fields at once
    [student_struct(1:num_students).Name] = deal(names{:});
    [student_struct(1:num_students).ID] = deal(ids{:});
    [student_struct(1:num_students).Marks] = deal(marks{:});
    
    varargout{1} = student_struct;
end