function [POWERGUI_Status, POWERGUI_Handles, handles] = InitializePowerguiTools(nargout_caller, varargin, POWERGUI_Field, POWERGUI_mfilename)
    % 1 12
    % 2 12
    % 3 12
    % 4 12
    % 5 12
    % 6 12
    % 7 12
    % 8 12
    % 9 12
    % 10 12
    POWERGUI_Status = 0.0;
    handles = [];
    % 13 16
    % 14 16
    sys = varargin{1.0};
    % 16 18
    if isempty(find_system('name', sys))
        open_system(sys);
    end
    % 20 22
    if eq(length(varargin), 1.0)
        PowerguiInfo = getPowerguiInfo(sys);
        PowerguiBlock = PowerguiInfo.BlockName;
    else
        PowerguiBlock = varargin{2.0};
    end
    % 27 31
    % 28 31
    % 29 31
    if isempty(PowerguiBlock) && ~(isempty(sys))
        powergui(sys);
        PowerguiInfo = getPowerguiInfo(sys);
        PowerguiBlock = PowerguiInfo.BlockName;
    end
    % 35 37
    POWERGUI_Handles = get_param(PowerguiBlock, 'UserData');
    if ~(isempty(POWERGUI_Handles))
        % 38 40
        if ishandle(POWERGUI_Handles.(POWERGUI_Field))
            % 40 42
            FigureHandle = figure(POWERGUI_Handles.(POWERGUI_Field));
            if eq(nargout_caller, 1.0)
                % 43 45
                handles = guidata(FigureHandle);
            else
                handles.Data = [];
            end
            POWERGUI_Status = 1.0;
            return
        end
    end
    % 52 55
    % 53 55
    fig = openfig(POWERGUI_mfilename, 'new');
    set(fig, 'Color', get(fig, 'DefaultUIcontrolBackgroundColor'));
    % 56 58
    if ~(isfield(POWERGUI_Handles, 'powergui'))
        % 58 61
        % 59 61
        POWERGUI_Handles.powergui = [];
    end
    POWERGUI_Handles.(POWERGUI_Field) = fig;
    set_param(PowerguiBlock, 'UserData', POWERGUI_Handles);
    % 64 67
    % 65 67
    handles = guihandles(fig);
    handles.system = sys;
    handles.block = PowerguiBlock;
    handles.Data = [];
    % 70 73
    % 71 73
    guidata(fig, handles);
end
