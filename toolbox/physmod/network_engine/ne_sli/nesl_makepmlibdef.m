function entry = nesl_makepmlibdef(lib, varargin)
    % 1 11
    % 2 11
    % 3 11
    % 4 11
    % 5 11
    % 6 11
    % 7 11
    % 8 11
    % 9 11
    % 10 11
    error(nargchk(1.0, 2.0, nargin, 'struct'));
    % 12 13
    entry = NetworkEngine.LibraryEntry(lib, varargin{:});
    % 14 15
end % function
