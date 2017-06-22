function out = projecthandler(action, varargin)
    % 1 13
    % 2 13
    % 3 13
    % 4 13
    % 5 13
    % 6 13
    % 7 13
    % 8 13
    % 9 13
    % 10 13
    % 11 13
    switch action
    case 'saveproject'
        try
            projectName = varargin{1.0};
            xmlName = varargin{2.0};
            modelObjs = varargin{3.0};
            matFileNames = varargin{4.0};
            diagramNames = varargin{5.0};
            imageNames = varargin{6.0};
            cleanup = varargin{7.0};
            % 22 25
            % 23 25
            varNames = {};
            for i=0.0:minus(modelObjs.size, 1.0)
                next = handle(modelObjs.elementAt(i));
                nextName = horzcat('m', num2str(plus(i, 1.0)));
                eval(horzcat(nextName, ' = next;'));
                varNames{plus(end, 1.0)} = nextName;
            end % for
            % 31 34
            % 32 34
            if not(isempty(varNames))
                sbiosaveproject(projectName, varNames{:}, '-force');
            else
                sbiosaveproject(projectName);
            end % if
            % 38 41
            % 39 41
            privateadddesktopfilestoproject(projectName, xmlName);
            localDeleteFile(xmlName);
            % 42 45
            % 43 45
            for i=0.0:minus(matFileNames.size, 1.0)
                next = char(matFileNames.elementAt(i));
                privateadddesktopfilestoproject(projectName, next);
                % 47 49
                if cleanup
                    localDeleteFile(next);
                end % if
            end % for
            % 52 55
            % 53 55
            for i=0.0:minus(diagramNames.size, 1.0)
                next = char(diagramNames.elementAt(i));
                privateadddesktopfilestoproject(projectName, next);
                % 57 59
                if cleanup
                    localDeleteFile(next);
                end % if
            end % for
            % 62 65
            % 63 65
            for i=0.0:minus(imageNames.size, 1.0)
                next = char(imageNames.elementAt(i));
                privateadddesktopfilestoproject(projectName, next);
                % 67 69
                if cleanup
                    localDeleteFile(next);
                end % if
            end % for
            % 72 74
            out = {};
        catch
            if exist(xmlName)
                localDeleteFile(xmlName);
            end % if
            out = lasterr;
        end % try
    case 'loadproject'
        try
            % 82 84
            privateloadsbiomodel;
            % 84 87
            % 85 87
            projectName = varargin{1.0};
            % 87 90
            % 88 90
            sbioloadproject(projectName);
            % 90 93
            % 91 93
            varinfo = whos;
            % 93 96
            % 94 96
            xmlName = privategetdesktopfiles(projectName, 'sbiotp\d*.xml');
            if isempty(xmlName)
                xmlName = '';
                % 98 101
                % 99 101
                varNames = localLoadCommandLineProject(varinfo);
            else
                xmlName = xmlName{1.0};
                % 103 106
                % 104 106
                varNames = localLoadDesktopProject(varinfo);
            end % if
            % 107 110
            % 108 110
            objs = {};
            for i=1.0:length(varNames)
                next = varNames{i};
                eval(horzcat('objs{end+1} = ', next, ';'));
            end % for
            % 114 117
            % 115 117
            objNames = {};
            if not(isempty(objs))
                objs = horzcat(objs{:});
                objNames = get(objs, {'Name'});
                objs = java(objs);
            end % if
            % 122 125
            % 123 125
            [newName, origName] = privategetdesktopfiles(projectName, 'sbiotp\d*.mat');
            % 125 128
            % 126 128
            [newDiagramName, origDiagramName] = privategetdesktopfiles(projectName, 'sbiotp\d*.view');
            % 128 131
            % 129 131
            [newImageName, origImageName] = privategetdesktopfiles(projectName, 'sbiotp\d*.images');
            % 131 134
            % 132 134
            out = cellhorzcat(xmlName, objs, newName, origName, objNames, newDiagramName, origDiagramName, newImageName, origImageName, true);
        catch
            out = localReadBetaProjectFile(projectName);
        end % try
    end % switch
function varNames = localLoadCommandLineProject(varinfo)
    % 139 143
    % 140 143
    % 141 143
    varNames = {};
    nameinfo = cellhorzcat(varinfo.name);
    classinfo = cellhorzcat(varinfo.class);
    % 145 147
    for i=1.0:length(classinfo)
        if strcmp(classinfo{i}, 'SimBiology.Model')
            varNames{plus(end, 1.0)} = nameinfo{i};
        end % if
    end % for
function varNames = localLoadDesktopProject(varinfo)
    % 152 156
    % 153 156
    % 154 156
    varNames = {};
    nameinfo = cellhorzcat(varinfo.name);
    varName = 'm1';
    count = 2.0;
    % 159 161
        while any(strcmp(nameinfo, varName))
        varNames{plus(end, 1.0)} = varName;
        varName = horzcat('m', num2str(count));
        count = plus(count, 1.0);
    end % while
function localDeleteFile(name)
    % 166 170
    % 167 170
    % 168 170
    oldState = recycle;
    recycle('off');
    delete(name)
    recycle(oldState);
function out = localReadBetaProjectFile(xmlname)
    % 174 184
    % 175 184
    % 176 184
    import com.mathworks.toolbox.simbio.util.*;
    import com.mathworks.toolbox.simbio.desktop.util.*;
    import org.w3c.dom.Element;
    import org.w3c.dom.Node;
    import org.w3c.dom.NodeList;
    % 182 184
    INVALID_MSG = 'Invalid project file.';
    % 184 186
    try
        % 186 188
        out = [];
        % 188 191
        % 189 191
        [p, n, ext] = fileparts(xmlname);
        reader = com.mathworks.toolbox.simbio.util.PreferenceFileReader(p, horzcat(n, ext));
        % 192 195
        % 193 195
        if isempty(reader)
            out = INVALID_MSG;
            return;
        end % if
        % 198 201
        % 199 201
        node = reader.getNode('Project');
        if isempty(node)
            out = INVALID_MSG;
            return;
        end % if
        % 205 208
        % 206 208
        children = node.getChildNodes;
        modelNode = children.item(1.0);
        % 209 211
        if eq(strcmp(char(modelNode.getNodeName), 'ProjectModels'), false)
            out = INVALID_MSG;
            return;
        end % if
        % 214 217
        % 215 217
        children = modelNode.getChildNodes;
        models = {};
        data = {};
        % 219 221
        for i=0.0:minus(children.getLength, 1.0)
            name = children.item(i).getNodeName;
            if strcmp(name, 'Model')
                % 223 225
                element = children.item(i);
                models{plus(end, 1.0)} = char(element.getAttribute('Path'));
                % 226 230
                % 227 230
                % 228 230
                data{plus(end, 1.0)} = localGetDataPath(element);
            end % if
        end % for
        % 232 235
        % 233 235
        objs = {};
        objNames = {};
        for i=1.0:length(models)
            try
                % 238 241
                % 239 241
                obj = sbmlimport(models{i});
                objNames{plus(end, 1.0)} = get(obj, 'Name');
                objs{plus(end, 1.0)} = obj;
            catch
                data(i) = [];
            end % try
        end % for
        % 247 249
        if not(isempty(objs))
            objs = horzcat(objs{:});
            objs = java(objs);
        end % if
        % 252 254
        out = cellhorzcat(xmlname, objs, data, data, objNames, {}, {}, false);
    catch
        out = INVALID_MSG;
    end % try
function dataPath = localGetDataPath(element)
    % 258 262
    % 259 262
    % 260 262
    dataPath = '';
    % 262 264
    modelChildren = element.getChildNodes;
    for j=0.0:minus(modelChildren.getLength, 1.0)
        modelChildName = modelChildren.item(j).getNodeName;
        if strcmp(modelChildName, 'Data')
            dataPath = char(modelChildren.item(j).getAttribute('DataPath'));
            return;
        end % if
    end % for
