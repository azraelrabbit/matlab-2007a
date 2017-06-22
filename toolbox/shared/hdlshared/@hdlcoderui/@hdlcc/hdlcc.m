function this = hdlcc(model)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    error(nargchk(0.0, 1.0, nargin));
    if lt(nargin, 1.0)
        model = bdroot;
    end % if
    this = hdlcoderui.hdlcc;
    this.Description = 'HDL Coder custom configuration component';
    % 15 17
    if hdlcoderui.isslhdlcinstalled
        % 17 20
        % 18 20
        this.HDLCoder = slhdlcoder.HDLCoder(model);
    else
        % 21 25
        % 22 25
        % 23 25
        return;
    end % if
    % 26 31
    % 27 31
    % 28 31
    % 29 31
    this.mdlName = model;
    % 31 39
    % 32 39
    % 33 39
    % 34 39
    % 35 39
    % 36 39
    % 37 39
    hGS = hdlcoderui.hdlglblsettings;
    % 39 45
    % 40 45
    % 41 45
    % 42 45
    % 43 45
    hTB = hdlcoderui.hdltb;
    % 45 48
    % 46 48
    hEDA = hdlcoderui.hdledas;
    % 48 52
    % 49 52
    % 50 52
    comps = horzcat(hGS, hTB, hEDA);
    % 52 64
    % 53 64
    % 54 64
    % 55 64
    % 56 64
    % 57 64
    % 58 64
    % 59 64
    % 60 64
    % 61 64
    % 62 64
    set(this, 'Name', 'HDL Coder', 'SubComponents', comps, 'ReadOnly', 'On');
    % 64 69
    % 65 69
    % 66 69
    % 67 69
    if not(isempty(this.mdlName))
        this.registerEventsForModel(this.mdlName);
    end % if
end % function
