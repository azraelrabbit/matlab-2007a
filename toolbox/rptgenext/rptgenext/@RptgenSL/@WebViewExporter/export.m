function fileName = export(rootSys, searchScope, lookUnderMasks, followLinks, varargin)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    vg = RptgenSL.WebViewGenerator;
    if gt(nargin, 1.0)
        vg.SearchScope = searchScope;
        if gt(nargin, 2.0)
            vg.LookUnderMasks = lookUnderMasks;
            if gt(nargin, 3.0)
                vg.followLinks = followLinks;
                if gt(nargin, 4.0)
                    vg.AdditionalArguments = varargin;
                end % if
            end % if
        end % if
    end % if
    % 23 24
    if gt(nargin, 0.0)
        drawObj = this.findSystems(rootSys);
        vg.generateFile(drawObj);
    else
        vg.generateFile;
    end % if
end % function
