function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    pkg = findpackage('rptgen');
    pkgRG = findpackage('rptgen');
    % 9 11
    h = schema.class(pkg, 'appdata_rg', pkgRG.findclass('appdata'));
    % 11 14
    % 12 14
    p = newSchema(h, 'ImageDirectory', 'String', '');
    p.AccessFlags.AbortSet = 'off';
    p.getFunction = @gvImageDirectory;
    % 16 19
    % 17 19
    p = newSchema(h, 'ImageDirectoryRelative', 'String', '');
    p.AccessFlags.AbortSet = 'off';
    p.getFunction = @gvImageDirectoryRelative;
    % 21 24
    % 22 24
    p = newSchema(h, 'Language', 'String');
    p.Visible = 'off';
    % 25 28
    % 26 28
    p = newSchema(h, 'HaltGenerate', 'bool', true);
    % 28 31
    % 29 31
    p = newSchema(h, 'DebugMode', 'bool', true);
    % 31 34
    % 32 34
    p = newSchema(h, 'PostConvertImport', 'bool', false);
    % 34 37
    % 35 37
    p = rptgen.prop(h, 'GenerationStatus', {'unset','Unset';'report','Generating report';'idoc','Interactive documentation';'none','None'}, 'unset', 'Status', 1.0);
    % 37 45
    % 38 45
    % 39 45
    % 40 45
    % 41 45
    % 42 45
    % 43 45
    p = newSchema(h, 'RootComponent', 'handle');
    p.AccessFlags.AbortSet = 'off';
    p.getFunction = @gvRootComponent;
    % 47 50
    % 48 50
    p = newSchema(h, 'Editor', 'handle');
    % 50 53
    % 51 53
    findclass(findpackage('rpt_xml'), 'document');
    p = newSchema(h, 'CurrentDocument', 'rpt_xml.document');
    p.AccessFlags.AbortSet = 'off';
    p.getFunction = @gvCurrentDocument;
    % 56 59
    % 57 59
    p = newSchema(h, 'DocbookSectionCounter', 'int32', -1.0);
    p.AccessFlags.AbortSet = 'off';
    p.getFunction = @gvDocbookSectionCounter;
    % 61 64
    % 62 64
    p = newSchema(h, 'EntityManager', 'java.lang.Object');
    p.AccessFlags.AbortSet = 'off';
    p.getFunction = @gvEntityManager;
function p = newSchema(h, name, dataType, factoryValue)
    % 67 72
    % 68 72
    % 69 72
    % 70 72
    p = schema.prop(h, name, dataType);
    p.AccessFlags.Init = 'on';
    p.AccessFlags.Reset = 'on';
    % 74 76
    if gt(nargin, 3.0)
        p.FactoryValue = factoryValue;
    end % if
function val = gvImageDirectory(this, val)
    % 79 85
    % 80 85
    % 81 85
    % 82 85
    % 83 85
    if isempty(val) && this.ImplyValues
        c = this.RootComponent;
        dstFile = c.Output.DstFileName;
        if isempty(dstFile)
            val = fullfile(pwd, 'report_html_files');
            this.ImageDirectoryRelative = './report_html_files/';
        else
            [rDir, rFile, rExt] = fileparts(dstFile);
            val = fullfile(rDir, sprintf('%s_%s_files', rFile, rExt(2.0:end)));
            this.ImageDirectoryRelative = sprintf('./%s_%s_files/', rFile, rExt(2.0:end));
        end % if
        this.ImageDirectory = val;
    end % if
function val = gvImageDirectoryRelative(this, val)
    % 98 102
    % 99 102
    % 100 102
    if isempty(val) && this.ImplyValues
        % 102 104
        gvImageDirectory(this, []);
        val = this.ImageDirectoryRelative;
    end % if
function val = gvRootComponent(this, val)
    % 107 111
    % 108 111
    % 109 111
    if isempty(val) && this.ImplyValues
        val = rptgen.coutline;
        this.RootComponent = val;
    end % if
function val = gvCurrentDocument(this, val)
    % 115 119
    % 116 119
    % 117 119
    if isempty(val) && this.ImplyValues
        val = rpt_xml.document('sect1');
        this.CurrentDocument = val;
    end % if
function val = gvDocbookSectionCounter(this, val)
    % 123 127
    % 124 127
    % 125 127
    if lt(val, 0.0) && this.ImplyValues
        val = 0.0;
        this.DocbookSectionCounter = val;
    end % if
function val = gvEntityManager(this, val)
    % 131 135
    % 132 135
    % 133 135
    if isempty(val)
        val = com.mathworks.toolbox.rptgencore.docbook.EntityManager;
        this.EntityManager = val;
    end % if
