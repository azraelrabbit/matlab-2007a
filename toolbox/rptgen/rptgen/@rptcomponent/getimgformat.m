function fInfo = getimgformat(c, ID)
    % 1 30
    % 2 30
    % 3 30
    % 4 30
    % 5 30
    % 6 30
    % 7 30
    % 8 30
    % 9 30
    % 10 30
    % 11 30
    % 12 30
    % 13 30
    % 14 30
    % 15 30
    % 16 30
    % 17 30
    % 18 30
    % 19 30
    % 20 30
    % 21 30
    % 22 30
    % 23 30
    % 24 30
    % 25 30
    % 26 30
    % 27 30
    % 28 30
    % 29 30
    allFormats = allFormatsList;
    switch ID
    case 'ALL'
        idx = 1.0:size(allFormats, 1.0);
    case 'ALLSL'
        idx = find(horzcat(allFormats{:, 6.0}));
    case 'ALLSF'
        idx = find(horzcat(allFormats{:, 7.0}));
    case 'ALLHG'
        idx = find(horzcat(allFormats{:, 8.0}));
    case 'AUTOSL'
        ID = LocGetAutoID(c, 'ImageSL');
        idx = find(strcmp(allFormats(:, 1.0), ID));
    case 'AUTOSF'
        ID = LocGetAutoID(c, 'ImageSF');
        idx = find(strcmp(allFormats(:, 1.0), ID));
    case 'AUTOHG'
        ID = LocGetAutoID(c, 'ImageHG');
        idx = find(strcmp(allFormats(:, 1.0), ID));
    otherwise
        idx = find(strcmp(allFormats(:, 1.0), ID));
    end % switch
    % 52 53
    fInfo = struct('ID', allFormats(idx, 1.0), 'name', allFormats(idx, 2.0), 'ext', allFormats(idx, 3.0), 'driver', allFormats(idx, 4.0), 'options', allFormats(idx, 5.0), 'isSL', allFormats(idx, 6.0), 'isSF', allFormats(idx, 7.0), 'isHG', allFormats(idx, 8.0));
    % 54 60
    % 55 60
    % 56 60
    % 57 60
    % 58 60
    % 59 60
end % function
function allFormats = allFormatsList
    % 62 75
    % 63 75
    % 64 75
    % 65 75
    % 66 75
    % 67 75
    % 68 75
    % 69 75
    % 70 75
    % 71 75
    % 72 75
    % 73 75
    % 74 75
    rezString = sprintf('-r%i', round(get(0.0, 'screenpixelsperinch')));
    % 76 77
    allFormats = vertcat({'ps','Black and white PostScript','ps','-dps',{},[1.0],[1.0],[1.0]}, {'psc','Color PostScript','ps','-dpsc',{},[1.0],[1.0],[1.0]}, {'ps2','Black and white PostScript2','ps','-dps2',{},[1.0],[1.0],[1.0]}, {'psc2','Color PostScript2','ps','-dpsc2',{},[1.0],[1.0],[1.0]}, {'eps','Black and white encapsulated PostScript','eps','-deps',{},[1.0],[1.0],[1.0]}, {'epsc','Color encapsulated PostScript','eps','-depsc',{},[1.0],[1.0],[1.0]}, {'eps2','Black and white encapsulated PostScript2','eps','-deps2',{},[1.0],[1.0],[1.0]}, {'epsc2','Color encapsulated PostScript2','eps','-depsc2',{},[1.0],[1.0],[1.0]}, {'epst','Black and white encapsulated PostScript (TIFF preview)','eps','-deps',{'-tiff'},[1.0],[1.0],[1.0]}, {'epsct','Color encapsulated PostScript (TIFF preview)','eps','-depsc',{'-tiff'},[1.0],[1.0],[1.0]}, {'eps2t','Black and white encapsulated PostScript2 (TIFF preview)','eps','-deps2',{'-tiff'},[1.0],[1.0],[1.0]}, {'epsc2t','Color encapsulated PostScript2 (TIFF preview)','eps','-depsc2',{'-tiff'},[1.0],[1.0],[1.0]}, {'ill','Adobe Illustrator','ill','-dill',{},[0.0],[1.0],[1.0]}, cellhorzcat('bmp256', '256-color bitmap', 'bmp', '-dbmp256', cellhorzcat(rezString), 1.0, 1.0, 1.0), cellhorzcat('bmp16m', '16m-color bitmap', 'bmp', '-dbmp16m', cellhorzcat(rezString), 1.0, 1.0, 1.0), cellhorzcat('jpeg90', 'JPEG high quality image', 'jpg', '-djpeg90', cellhorzcat(rezString), 1.0, 1.0, 1.0), cellhorzcat('jpeg75', 'JPEG medium quality image', 'jpg', '-djpeg75', cellhorzcat(rezString), 1.0, 1.0, 1.0), cellhorzcat('jpeg30', 'JPEG low quality image', 'jpg', '-djpeg30', cellhorzcat(rezString), 1.0, 1.0, 1.0), cellhorzcat('png', 'PNG - Portable Network Graphics 24-bit image', 'png', '-dpng', cellhorzcat(rezString), 1.0, 1.0, 1.0), cellhorzcat('tiffc', 'TIFF - compressed', 'tiff', '-dtiff', cellhorzcat(rezString), 0.0, 1.0, 1.0), cellhorzcat('tiffu', 'TIFF - uncompressed', 'tiff', '-dtiffnocompression', cellhorzcat(rezString), 0.0, 1.0, 1.0), cellhorzcat('wmf', 'Windows metafile', 'emf', '-dmeta', {}, ispc, ispc, ispc), {'AUTOHG','Automatic Handle Graphics Format','','',{},[0.0],[0.0],[1.0]}, {'AUTOSL','Automatic Simulink Format','','',{},[1.0],[0.0],[0.0]}, {'AUTOSF','Automatic Stateflow Format','','',{},[0.0],[1.0],[0.0]});
    % 78 128
    % 79 128
    % 80 128
    % 81 128
    % 82 128
    % 83 128
    % 84 128
    % 85 128
    % 86 128
    % 87 128
    % 88 128
    % 89 128
    % 90 128
    % 91 128
    % 92 128
    % 93 128
    % 94 128
    % 95 128
    % 96 128
    % 97 128
    % 98 128
    % 99 128
    % 100 128
    % 101 128
    % 102 128
    % 103 128
    % 104 128
    % 105 128
    % 106 128
    % 107 128
    % 108 128
    % 109 128
    % 110 128
    % 111 128
    % 112 128
    % 113 128
    % 114 128
    % 115 128
    % 116 128
    % 117 128
    % 118 128
    % 119 128
    % 120 128
    % 121 128
    % 122 128
    % 123 128
    % 124 128
    % 125 128
    % 126 128
    % 127 128
    if ispc
        pcFormats = {'png-capture','PNG (screenshot)','png','-dbitmap',{},[1.0],[0.0],[0.0];'bmp-capture','Bitmap (screenshot)','bmp','-dbitmap',{},[0.0],[0.0],[0.0]};
        % 130 134
        % 131 134
        % 132 134
        % 133 134
        allFormats = vertcat(allFormats, pcFormats);
    end % if
end % function
function autoID = LocGetAutoID(c, autoType)
    % 138 140
    % 139 140
    targetFormat = subsref(rptcomponent, substruct('.', 'Format'));
    % 141 142
    allPrefs = preferences(c);
    allPrefs = allPrefs.format;
    formatIndex = find(strcmpi(cellhorzcat(allPrefs.Name), targetFormat));
    if isempty(formatIndex)
        formatIndex = 1.0;
    else
        formatIndex = formatIndex(1.0);
    end % if
    % 150 151
    autoID = getfield(allPrefs(formatIndex), autoType);
end % function
