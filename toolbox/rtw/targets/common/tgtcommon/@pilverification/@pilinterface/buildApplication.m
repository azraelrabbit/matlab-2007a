function buildApplication(h)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    error(nargchk(1.0, 1.0, nargin, 'struct'));
    % 8 10
    % 9 10
    interface = h.getInterfaceDescription;
    % 11 12
    algBuildObject = h.getAlgorithmBuildObject;
    % 13 14
    APPLICATION_DIR = h.getApplicationDir;
    % 15 16
    thisDir = fileparts(mfilename('fullpath'));
    LIB_DIR = fullfile(thisDir, '..', '..', 'pilsrc');
    % 18 20
    % 19 20
    pil_interface = h.p_generateTargetInterface(interface);
    pil_interface_c = fullfile(APPLICATION_DIR, 'pil_interface.c');
    fid = fopen(pil_interface_c, 'w');
    fprintf(fid, '%s', pil_interface);
    fclose(fid);
    % 25 27
    % 26 27
    [pil_interface, pil_interface_header, pil_interface_header_name] = h.p_generateHostSfunction(interface);
    % 28 31
    % 29 31
    % 30 31
    [host_sfun, host_sfunpath] = h.getMSfunction;
    % 32 34
    % 33 34
    clear(horzcat(host_sfun, '.m'));
    % 35 36
    fid = fopen(fullfile(host_sfunpath, horzcat(host_sfun, '.m')), 'w');
    fprintf(fid, '%s', pil_interface);
    fclose(fid);
    % 39 41
    % 40 41
    fid = fopen(fullfile(APPLICATION_DIR, pil_interface_header_name), 'w');
    fprintf(fid, '%s', pil_interface_header);
    fclose(fid);
    % 44 46
    % 45 46
    appBuildObj = h.appBuildObj;
    % 47 48
    libs = algBuildObject.LinkObj;
    for i=1.0:length(libs)
        l = appBuildObj.addLibraries(libs(i).Name, libs(i).Path);
        % 51 52
        l.LinkOnly = true;
    end % for
    % 54 57
    % 55 57
    % 56 57
    replaceMATLABROOT = true;
    paths = algBuildObject.getIncludePaths(replaceMATLABROOT);
    appBuildObj.addIncludePaths(paths);
    % 60 63
    % 61 63
    % 62 63
    defines = algBuildObject.getDefines;
    appBuildObj.addDefines(defines);
    % 65 67
    % 66 67
    appBuildObj.BuildArgs = algBuildObject.BuildArgs;
    % 68 70
    % 69 70
    appBuildObj.addSourceFiles('pil_interface_lib.c', LIB_DIR);
    % 71 72
    appBuildObj.addIncludeFiles('pil_interface.h', LIB_DIR);
    appBuildObj.addIncludeFiles('pil_interface_common.h', LIB_DIR);
    appBuildObj.addIncludeFiles('pil_interface_lib.h', LIB_DIR);
    % 75 76
    appBuildObj.addSourceFiles('pil_interface.c', APPLICATION_DIR);
    appBuildObj.addIncludeFiles('pil_interface_data.h', APPLICATION_DIR);
    % 78 79
    appBuildObj.addIncludePaths(LIB_DIR);
    % 80 81
    appBuildObj.addIncludePaths(APPLICATION_DIR);
    % 82 84
    % 83 84
    appBuildObjPath = fullfile(APPLICATION_DIR, 'buildInfo.mat');
    save(appBuildObjPath, 'appBuildObj');
    % 86 88
    % 87 88
    h.a_buildApplication(appBuildObjPath);
end % function
