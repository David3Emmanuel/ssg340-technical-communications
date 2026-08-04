
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
for studentIdx = 1:length(students)
    fprintf('Name: %s, ID: %s, Avg Mark: %.2f\n', students(studentIdx).Name, students(studentIdx).ID, mean(students(studentIdx).Marks));
end

% 3: Cell array storing different types of data
mixedCell = {'Systems Engineering', 2026, students(1), [1.1, 2.2, 3.3]};

% 4: Access and manipulate data in cell array
fprintf('\nAccessing Cell Array:\n');
fprintf('String data: %s\n', mixedCell{1});
fprintf('Numeric data: %d\n', mixedCell{2});
fprintf('Student Name from struct in cell: %s\n', mixedCell{3}.Name);

% Modify structure field inside the cell array
mixedCell{3}.Marks = [100, 100, 100];
fprintf('Modified Student Marks in cell: [%d, %d, %d]\n', mixedCell{3}.Marks);

% 5: Call the variable argument function (defined at the end of the script)
fprintf('\nCreating structures with varargin:\n');
[dynamicStudents] = createStudents('Ali', 'ENG003', [70 75 80], 'Zainab', 'ENG004', [99 98 97]);
disp(dynamicStudents);
for studentIdx = 1:length(dynamicStudents)
    fprintf('Dynamic Student %d: %s (%s)\n', studentIdx, dynamicStudents(studentIdx).Name, dynamicStudents(studentIdx).ID);
end

%% Helper Function for 11.5 Task 5
% Note: In MATLAB, local functions must be placed at the end of the script file.
function [varargout] = createStudents(varargin)
    % Calculates the number of students provided (3 arguments per student: Name, ID, Marks)
    studentCount = nargin / 3;

    if mod(nargin, 3) ~= 0
        error('Inputs must be provided in multiples of 3 (Name, ID, Marks).');
    end

    % Use cell() to create cell arrays as requested in the hint
    nameCells = cell(1, studentCount);
    idCells = cell(1, studentCount);
    markCells = cell(1, studentCount);

    for buildIdx = 1:studentCount
        nameCells{buildIdx} = varargin{(buildIdx-1)*3 + 1};
        idCells{buildIdx} = varargin{(buildIdx-1)*3 + 2};
        markCells{buildIdx} = varargin{(buildIdx-1)*3 + 3};
    end

    % Use struct() and deal() to assign values to multiple fields at once
    [builtStudents(1:studentCount).Name] = deal(nameCells{:});
    [builtStudents(1:studentCount).ID] = deal(idCells{:});
    [builtStudents(1:studentCount).Marks] = deal(markCells{:});

    varargout{1} = builtStudents;
end
