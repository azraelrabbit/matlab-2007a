function varargout = set(h, varargin)
    % 1 21
    % 2 21
    % 3 21
    % 4 21
    % 5 21
    % 6 21
    % 7 21
    % 8 21
    % 9 21
    % 10 21
    % 11 21
    % 12 21
    % 13 21
    % 14 21
    % 15 21
    % 16 21
    % 17 21
    % 18 21
    % 19 21
    SimulinkTsProps = {'BlockPath','PortIndex','SignalName','ParentName','RegionInfo'};
    if ge(nargin, 3.0)
        for k=1.0:floor(mrdivide(minus(nargin, 1.0), 2.0))
            if any(strcmpi(varargin{minus(mtimes(2.0, k), 1.0)}, SimulinkTsProps))
                h.(varargin{minus(mtimes(2.0, k), 1.0)}) = varargin{mtimes(2.0, k)};
            else
                if ~(strcmpi(varargin{minus(mtimes(2.0, k), 1.0)}, 'tsvalue'))
                    h.tsValue = set(h.tsValue, varargin{minus(mtimes(2.0, k), 1.0)}, varargin{mtimes(2.0, k)});
                else
                    h.tsValue = varargin{mtimes(2.0, k)};
                end
            end
        end % for
    else
        if eq(nargin, 2.0)
            if ~(ischar(varargin{1.0}))
                error('Timeseries:set:invprop', 'Specified property name must be identified with a string')
            end
            if any(strcmpi(varargin{1.0}, SimulinkTsProps))
                Out = get(h, varargin{1.0});
            else
                Out = set(h.TsValue, varargin{1.0});
            end
            if eq(nargout, 0.0)
                disp(Out);
            else
                varargout{1.0} = Out;
            end
        else
            if eq(nargin, 1.0)
                Out = set(h.TsValue);
                for k=1.0:numel(SimulinkTsProps)
                    Out.(SimulinkTsProps{k}) = h.(SimulinkTsProps{k});
                end % for
                if eq(nargout, 0.0)
                    disp(Out);
                else
                    varargout{1.0} = Out;
                end
            end
        end
    end
end
