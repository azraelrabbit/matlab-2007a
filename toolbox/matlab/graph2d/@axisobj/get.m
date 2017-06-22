function val = get(A, varargin)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    HGObj = A.scribehgobj;
    % 8 10
    if eq(nargin, 2.0)
        switch varargin{1.0}
        case 'Figure'
            HG = get(A, 'MyHGHandle');
            val = get(HG, 'Parent');
        case 'Axis'
            HG = get(A, 'MyHGHandle');
            fig = get(HG, 'Parent');
            axH = findall(fig, 'type', 'axes');
            if not(isempty(axH))
                val = double(find(handle(axH), '-class', 'graph2d.annotationlayer'));
                if isempty(val)
                    val = findall(axH, 'flat', 'Tag', 'ScribeOverlayAxesActive');
                end % if
            else
                val = [];
            end % if
        case 'ZoomScale'
            val = A.ZoomScale;
        otherwise
            val = get(HGObj, varargin{:});
        end % switch
    else
        val = get(HGObj, varargin{:});
    end % if
