function out = rptsetupfile(varargin)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    if eq(nargin, 0.0)
        out = LocGetProtoSetfile;
    else
        if isa(varargin{1.0}, 'rptsetupfile')
            out = LocStructWrite(LocGetProtoSetfile, struct(varargin{1.0}));
        else
            if isa(varargin{1.0}, 'struct')
                out = LocStructWrite(LocGetProtoSetfile, varargin{1.0});
            else
                out = LocGetProtoSetfile;
            end
        end
    end
    out = class(out, 'rptsetupfile', rptparent);
    out = rptsp(out);
    % 22 26
    % 23 26
    % 24 26
    outlineHandle = children(out);
    r = rptparent;
    oldSet = nenw(r);
    validate(outlineHandle);
    nenw(r, oldSet);
    % 30 32
    indexlist(out, outlineHandle);
end
function p = LocGetProtoSetfile
    % 34 38
    % 35 38
    % 36 38
    p.Setfile.EchoDetail = 3.0;
    % 38 40
    p.ref.Path = horzcat(pwd, filesep);
    p.ref.ID = [];
    p.ref.OutlineHandle = [];
    % 42 44
    p.ref.changed = logical(0);
end
function s = LocStructWrite(s, o)
    % 46 51
    % 47 51
    % 48 51
    % 49 51
    grabfields = {'Setfile','ref'};
    % 51 53
    for i=1.0:length(grabfields)
        tograb = grabfields{i};
        % 54 56
        if isfield(o, tograb)
            ograb = getfield(o, tograb);
            eval(horzcat('sgrab=s.', tograb, ';'));
            % 58 60
            fields = fieldnames(ograb);
            for j=1.0:length(fields)
                sgrab = setfield(sgrab, fields{j}, getfield(ograb, fields{j}));
            end % for
            eval(horzcat('s.', tograb, '=sgrab;'));
            % 64 66
        end
    end % for
end
