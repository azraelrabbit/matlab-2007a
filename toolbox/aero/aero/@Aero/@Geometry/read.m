function read(h, src)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    msg = 'The Source type cannot be inferred automatically from the file extension, please manually select a Source';
    % 8 10
    h.FaceVertexColorData = [];
    h.Name = '';
    % 11 14
    % 12 14
    if strcmp(h.Source, 'Auto')
        % 14 18
        % 15 18
        % 16 18
        if isa(src, 'char') && eq(exist(src, 'file'), 2.0)
            [p, n, extension] = fileparts(src);
            switch extension
            case '.mat'
                h.Source = 'MatFile';
            case '.ac'
                h.Source = 'Ac3d';
            otherwise
                error('Aero:Geometry:NoAutoReadForThisExtension', msg);
            end % switch
        else
            if isstruct(src) && all(isfield(src, {'name','faces','vertices','cdata'}))
                h.Source = 'Variable';
            else
                error('Aero:Geometry:NoAutoReadForThisExtension', msg);
            end % if
        end % if
        % 34 36
    end % if
    if strcmp(h.Source, 'Custom')
        if isa(h.Reader, 'function_handle')
            if isempty(which(func2str(h.Reader)))
                error('Aero:Geometry:NoReadFcn', 'Reader is not on path.');
            end % if
        else
            error('Aero:Geometry:NoFcnHandle', 'Reader is not a function handle.');
        end % if
    end % if
    [h.FaceVertexColorData, h.Name] = h.Reader(src, inputname(2.0));
    % 46 48
