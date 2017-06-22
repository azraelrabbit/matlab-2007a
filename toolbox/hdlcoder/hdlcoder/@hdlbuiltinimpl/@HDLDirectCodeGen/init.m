function init(this, varargin)
    % 1 88
    % 2 88
    % 3 88
    % 4 88
    % 5 88
    % 6 88
    % 7 88
    % 8 88
    % 9 88
    % 10 88
    % 11 88
    % 12 88
    % 13 88
    % 14 88
    % 15 88
    % 16 88
    % 17 88
    % 18 88
    % 19 88
    % 20 88
    % 21 88
    % 22 88
    % 23 88
    % 24 88
    % 25 88
    % 26 88
    % 27 88
    % 28 88
    % 29 88
    % 30 88
    % 31 88
    % 32 88
    % 33 88
    % 34 88
    % 35 88
    % 36 88
    % 37 88
    % 38 88
    % 39 88
    % 40 88
    % 41 88
    % 42 88
    % 43 88
    % 44 88
    % 45 88
    % 46 88
    % 47 88
    % 48 88
    % 49 88
    % 50 88
    % 51 88
    % 52 88
    % 53 88
    % 54 88
    % 55 88
    % 56 88
    % 57 88
    % 58 88
    % 59 88
    % 60 88
    % 61 88
    % 62 88
    % 63 88
    % 64 88
    % 65 88
    % 66 88
    % 67 88
    % 68 88
    % 69 88
    % 70 88
    % 71 88
    % 72 88
    % 73 88
    % 74 88
    % 75 88
    % 76 88
    % 77 88
    % 78 88
    % 79 88
    % 80 88
    % 81 88
    % 82 88
    % 83 88
    % 84 88
    % 85 88
    % 86 88
    if rem(length(varargin), 2.0)
        error(hdlcodererrormsgid('invalidargs'), '%s class called init with odd number of arguments', class(this));
        % 89 91
    end % if
    % 91 93
    block = localExtractPVPairs(this, varargin);
    % 93 95
    if isempty(block) && isempty(this.Blocks)
        error(hdlcodererrormsgid('nosupportedblock'), '%s constructor called with no supported block information', class(this));
        % 96 98
    end % if
    % 98 104
    % 99 104
    % 100 104
    % 101 104
    % 102 104
    if not(isempty(block))
        if not(isempty(this.Blocks))
            index = strcmp(block, this.Blocks);
            if not(any(index))
                error(hdlcodererrormsgid('unsupportedblock'), 'The %s class does not support the %s block', class(this), block);
                % 108 110
            end % if
        end % if
        if iscell(block)
            this.Blocks = block;
        else
            this.Blocks = cellhorzcat(block);
        end % if
    end % if
function block = localExtractPVPairs(this, args)
    % 118 122
    % 119 122
    % 120 122
    block = [];
    % 122 124
    for i=1.0:2.0:length(args)
        switch lower(args{i})
        case 'supportedblocks'
            blocks = regexprep(args{plus(i, 1.0)}, char(10.0), ' ');
            if not(iscell(blocks))
                blocks = cellhorzcat(blocks);
            end % if
            this.Blocks = blocks;
        case 'block'
            block = regexprep(args{plus(i, 1.0)}, char(10.0), ' ');
        case 'codegenmode'
            this.CodeGenMode = args{plus(i, 1.0)};
        case 'codegenfunc'
            this.CodeGenFunc = args{plus(i, 1.0)};
        case 'handletype'
            this.FirstParam = args{plus(i, 1.0)};
        case 'codegenparams'
            this.CodeGenParams = args{plus(i, 1.0)};
        case 'description'
            this.Description = args{plus(i, 1.0)};
        case 'estimatefunc'
            this.EstimateFunc = args{plus(i, 1.0)};
        case 'estimateparams'
            this.EstimateParams = args{plus(i, 1.0)};
        case 'generateslblock'
            this.generateSLBlock = args{plus(i, 1.0)};
        end % switch
    end % for
    % 151 153
    if isempty(this.Description)
        this.Description.ShortListing = class(this);
        switch this.CodeGenMode
        case 'vhdlemission'
            this.Description.HelpText = 'VHDL code generation via direct emission';
        case 'vhdlinstantiation'
            this.Description.HelpText = 'VHDL code generation via direct instantiation';
        case 'verilogemission'
            this.Description.HelpText = 'Verilog code generation via direct emission';
        case 'veriloginstantiation'
            this.Description.HelpText = 'Verilog code generation via direct instantiation';
        end % switch
    end % if
