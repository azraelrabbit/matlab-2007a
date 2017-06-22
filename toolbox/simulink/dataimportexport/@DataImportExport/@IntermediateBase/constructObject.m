function [hSourceObject, SourceFromParent] = constructObject(hIntermediate, hArrayNode, ParentArray)
    % 1 15
    % 2 15
    % 3 15
    % 4 15
    % 5 15
    % 6 15
    % 7 15
    % 8 15
    % 9 15
    % 10 15
    % 11 15
    % 12 15
    % 13 15
    hSourceObject = [];
    SourceFromParent = false;
    % 16 19
    % 17 19
    switch hArrayNode.FunctionalType
    case {'udd_object','udd_value'}
        % 20 22
        if isequal(prod(hArrayNode.Dimensions), 1.0)
            % 22 24
            if not(isempty(ParentArray))
                % 24 26
                AllReadablePropertyNames = hIntermediate.getAllReadablePropertyNames(ParentArray);
            else
                % 27 29
                % 28 30
                AllReadablePropertyNames = [];
            end % if
            % 31 34
            % 32 34
            if any(strcmp(hArrayNode.Name, AllReadablePropertyNames))
                % 34 36
                hSourceObject = get(ParentArray, hArrayNode.Name);
                % 36 39
                % 37 39
                if strcmp(hArrayNode.Class, class(hSourceObject))
                    % 39 41
                    SourceFromParent = true;
                else
                    % 42 45
                    % 43 45
                    hSourceObject = s_createObject(hArrayNode.Class);
                end % if
            else
                % 47 50
                % 48 50
                hSourceObject = s_createObject(hArrayNode.Class);
            end % if
        end % if
    otherwise
        % 53 56
        % 54 56
    end % switch
    % 56 58
function hSourceObject = s_createObject(ClassType)
    % 58 73
    % 59 73
    % 60 73
    % 61 73
    % 62 73
    % 63 73
    % 64 73
    % 65 73
    % 66 73
    % 67 73
    % 68 73
    % 69 73
    % 70 73
    % 71 73
    try
        % 73 75
        hSourceObject = feval(ClassType);
    catch
        % 76 78
        warning('off', 'backtrace')
        warning('JADID:JADID2', 'The source object %s could not be constructed.', ClassType);
        % 79 81
        hSourceObject = [];
        warning('on', 'backtrace')
    end % try
    % 83 85
