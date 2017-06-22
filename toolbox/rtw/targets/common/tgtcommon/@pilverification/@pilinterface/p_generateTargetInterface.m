function pil_interface = p_generateTargetInterface(h, interface)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    error(nargchk(2.0, 2.0, nargin, 'struct'));
    % 9 11
    % 10 11
    pil_interface = {};
    % 12 14
    % 13 14
    pil_interface = i_add(pil_interface, i_sectionHeader(interface));
    % 15 16
    pil_interface = i_add(pil_interface, i_sectionIncludes(interface));
    % 17 18
    pil_interface = i_add(pil_interface, i_sectionCurrSymbolPtr);
    % 19 20
    pil_interface = i_add(pil_interface, i_sectionGeneralStorage(interface));
    pil_interface = i_add(pil_interface, i_sectionStorage(interface));
    % 22 23
    pil_interface = i_add(pil_interface, i_sectionSymbols(interface));
    % 24 25
    pil_interface = i_add(pil_interface, i_sectionInit(interface));
    % 26 27
    pil_interface = i_add(pil_interface, i_sectionInitUDataProcessing(interface));
    % 28 29
    pil_interface = i_add(pil_interface, i_sectionProcessUData);
    % 30 31
    pil_interface = i_add(pil_interface, i_sectionStep(interface));
    % 32 33
    pil_interface = i_add(pil_interface, i_sectionInitYDataProcessing(interface));
    % 34 35
    pil_interface = i_add(pil_interface, i_sectionProcessYData);
    % 36 37
    pil_interface = i_add(pil_interface, i_sectionTerminate(interface));
    % 38 40
    % 39 40
    pil_interface = i_convertToString(pil_interface);
end % function
function text = i_sectionHeader(interface)
    % 43 49
    % 44 49
    % 45 49
    % 46 49
    % 47 49
    % 48 49
    text = vertcat({'/*'}, {' * File: pil_interface.c'}, {' *'}, cellhorzcat(horzcat(' * Real-Time Workshop Processor-in-the-Loop (PIL) generated interface for code: "', interface.modelname, '"')), {' *'}, {' */'});
    % 50 54
    % 51 54
    % 52 54
    % 53 54
end % function
function text = i_sectionIncludes(interface)
    % 56 57
    text = vertcat({'#include "pil_interface.h"'}, {'#include "pil_interface_lib.h"'}, cellhorzcat(horzcat('#include "', interface.modelname, '.h"')));
    % 58 59
end % function
function text = i_sectionCurrSymbolPtr
    % 61 62
    text = {'/* pointer to the Code Symbol that is currently';' * being processed */';'static const Symbol* currSymbolPtr = NULL;'};
    % 63 64
end % function
function text = i_sectionGeneralStorage(interface)
    % 66 67
    text = {};
    % 68 69
    if isfield(interface, 'general_storage')
        for i=1.0:length(interface.general_storage)
            text{plus(end, 1.0)} = interface.general_storage{i};
            % 72 73
            text{plus(end, 1.0)} = '';
        end % for
    end % if
end % function
function text = i_sectionStorage(interface)
    text = {};
    % 79 81
    % 80 81
    ports = horzcat(interface.input, interface.output);
    % 82 83
    for i=1.0:length(ports)
        port = ports(i);
        if port.storagerequired
            % 86 90
            % 87 90
            % 88 90
            % 89 90
            if isscalar(port.dimension)
                storage_size = port.dimension;
            else
                storage_size = mtimes(port.dimension(1.0), port.dimension(2.0));
            end % if
            % 95 96
            if port.direct
                % 97 98
                storage_name = port.symbol;
                % 99 100
                text{plus(end, 1.0)} = '/* storage for an imported extern required by the Algorithm */';
            else
                % 102 103
                storage_name = horzcat(port.symbol, '_pil_storage');
                % 104 105
                text{plus(end, 1.0)} = '/* storage for an imported extern pointer required by the Algorithm */';
            end % if
            if eq(storage_size, 1.0)
                text{plus(end, 1.0)} = horzcat(port.datatype, ' ', storage_name, ';');
            else
                text{plus(end, 1.0)} = horzcat(port.datatype, ' ', storage_name, '[', num2str(storage_size), '];');
                % 111 112
            end % if
            % 113 114
            if not(port.direct)
                if eq(storage_size, 1.0)
                    % 116 117
                    text{plus(end, 1.0)} = horzcat(port.datatype, ' * ', port.symbol, ' = &', storage_name, ';');
                else
                    % 119 121
                    % 120 121
                    text{plus(end, 1.0)} = horzcat(port.datatype, ' * ', port.symbol, ' = &', storage_name, '[0];');
                    % 122 123
                end % if
            end % if
            % 125 126
            text{plus(end, 1.0)} = '';
        end % if
    end % for
end % function
function text = i_sectionSymbols(interface)
    text = {};
    % 132 133
    multitasking = interface.multitasking;
    % 134 135
    text = i_processSymbols(text, multitasking, interface.input, 'U');
    % 136 137
    text = i_processSymbols(text, multitasking, interface.output, 'Y');
end % function
function text = i_sectionInit(interface)
    text = vertcat({'/* extern PIL Interface functions */'}, {''}, {'/* see pil_interface.h for documentation */'}, {'extern PIL_ERROR_CODE pilInitialize(int32_T fcnid) {'}, {'   /* Single PIL Algorithm */'}, {'   if (fcnid != 0) {'}, {'      return UNKNOWN_FCNID;'}, {'   }'}, cellhorzcat(horzcat('   ', interface.init_fcn, ';')), {'   return SUCCESS;'}, {'}'});
    % 141 150
    % 142 150
    % 143 150
    % 144 150
    % 145 150
    % 146 150
    % 147 150
    % 148 150
    % 149 150
end % function
function text = i_sectionInitUDataProcessing(interface)
    % 152 153
    text = {'extern PIL_ERROR_CODE initUDataProcessing(int32_T fcnid, int32_T tid) {';'   /* Single PIL Algorithm */';'   if (fcnid != 0) {';'      return UNKNOWN_FCNID;';'   }';'   switch(tid) {'};
    % 154 161
    % 155 161
    % 156 161
    % 157 161
    % 158 161
    % 159 161
    % 160 161
    multitasking = interface.multitasking;
    if multitasking
        % 163 164
        tids = i_getTIDsForPorts(interface.input);
    else
        % 166 167
        tids = 0.0;
    end % if
    % 169 171
    % 170 171
    for tid=tids
        text{plus(end, 1.0)} = horzcat('      case ', num2str(tid), ':');
        text{plus(end, 1.0)} = horzcat('         currSymbolPtr = &fcnid0_tid', num2str(tid), '_u[0];');
        text{plus(end, 1.0)} = '         break;';
    end % for
    % 176 178
    % 177 178
    text{plus(end, 1.0)} = '      default:';
    text{plus(end, 1.0)} = '         return UNKNOWN_TID;';
    text{plus(end, 1.0)} = '   }';
    text{plus(end, 1.0)} = '   return resetLibSymbolState();';
    text{plus(end, 1.0)} = '}';
end % function
function text = i_sectionProcessUData
    text = {'extern PIL_ERROR_CODE processUData(int32_T memUnitDataLength, MemUnit_T * DATA) {';'   return processData(memUnitDataLength, DATA, &currSymbolPtr, UDATA_IO);';'}';'';'extern PIL_ERROR_CODE checkDataProcessingComplete(void) {';'   return checkDataProcessing(&currSymbolPtr);';'}'};
    % 186 191
    % 187 191
    % 188 191
    % 189 191
    % 190 191
end % function
function text = i_sectionStep(interface)
    % 193 194
    text = {'/* see pil_interface.h for documentation */';'extern PIL_ERROR_CODE pilStep(int32_T fcnid, int32_T tid) {';'   /* Single PIL Algorithm */';'   if (fcnid != 0) {';'      return UNKNOWN_FCNID;';'   }';'   switch(tid) {'};
    % 195 203
    % 196 203
    % 197 203
    % 198 203
    % 199 203
    % 200 203
    % 201 203
    % 202 203
    multitasking = interface.multitasking;
    if multitasking
        % 205 206
        tids = i_getTIDsForPorts(horzcat(interface.input, interface.output));
    else
        % 208 209
        tids = 0.0;
    end % if
    % 211 213
    % 212 213
    for tid=tids
        text{plus(end, 1.0)} = horzcat('      case ', num2str(tid), ':');
        text{plus(end, 1.0)} = horzcat('         ', interface.step_fcn{plus(tid, 1.0)});
        text{plus(end, 1.0)} = '         break;';
    end % for
    % 218 220
    % 219 220
    text{plus(end, 1.0)} = '      default:';
    text{plus(end, 1.0)} = '         return UNKNOWN_TID;';
    text{plus(end, 1.0)} = '   }';
    text{plus(end, 1.0)} = '   return SUCCESS;';
    text{plus(end, 1.0)} = '}';
end % function
function text = i_sectionInitYDataProcessing(interface)
    text = {'extern PIL_ERROR_CODE initYDataProcessing(int32_T fcnid, int32_T tid) {';'   /* Single PIL Algorithm */';'   if (fcnid != 0) {';'      return UNKNOWN_FCNID;';'   }';'   switch(tid) {'};
    % 228 235
    % 229 235
    % 230 235
    % 231 235
    % 232 235
    % 233 235
    % 234 235
    multitasking = interface.multitasking;
    if multitasking
        % 237 238
        tids = i_getTIDsForPorts(interface.output);
    else
        % 240 241
        tids = 0.0;
    end % if
    % 243 245
    % 244 245
    for tid=tids
        text{plus(end, 1.0)} = horzcat('      case ', num2str(tid), ':');
        text{plus(end, 1.0)} = horzcat('         currSymbolPtr = &fcnid0_tid', num2str(tid), '_y[0];');
        text{plus(end, 1.0)} = '         break;';
    end % for
    % 250 252
    % 251 252
    text{plus(end, 1.0)} = '      default:';
    text{plus(end, 1.0)} = '         return UNKNOWN_TID;';
    text{plus(end, 1.0)} = '   }';
    text{plus(end, 1.0)} = '   return resetLibSymbolState();';
    text{plus(end, 1.0)} = '}';
end % function
function text = i_sectionProcessYData
    text = {'extern PIL_ERROR_CODE processYData(int32_T memUnitDataLength, MemUnit_T * DATA) {';'   return processData(memUnitDataLength, DATA, &currSymbolPtr, YDATA_IO);';'}'};
    % 260 261
end % function
function text = i_sectionTerminate(interface)
    % 263 264
    text = vertcat({'/* see pil_interface.h for documentation */'}, {'extern PIL_ERROR_CODE pilTerminate(int32_T fcnid) {'}, {'   /* Single PIL Algorithm */'}, {'   if (fcnid != 0) {'}, {'      return UNKNOWN_FCNID;'}, {'   }'}, cellhorzcat(horzcat('   ', interface.term_fcn, ';')), {'   return SUCCESS;'}, {'}'});
    % 265 272
    % 266 272
    % 267 272
    % 268 272
    % 269 272
    % 270 272
    % 271 272
end % function
function indices = i_findPortsForTID(tid, ports)
    % 274 282
    % 275 282
    % 276 282
    % 277 282
    % 278 282
    % 279 282
    % 280 282
    % 281 282
    if isempty(ports)
        indices = [];
    else
        % 285 286
        indices = find(eq(horzcat(ports.tid), tid));
    end % if
end % function
function tids = i_getTIDsForPorts(ports)
    % 290 291
    if isempty(ports)
        tids = [];
    else
        tids = unique(horzcat(ports.tid));
    end % if
end % function
function pil_interface = i_add(pil_interface, text)
    % 298 299
    if not(isempty(text))
        pil_interface = cellhorzcat(pil_interface{:}, text{:}, '');
    end % if
end % function
function string = i_convertToString(text)
    % 304 306
    % 305 306
    string = [];
    for i=1.0:length(text)
        string = horzcat(string, text{i}, sprintf('\n'));
    end % for
end % function
function text = i_processSymbols(text, multitasking, ports, iotag)
    % 312 315
    % 313 315
    % 314 315
    if multitasking
        % 316 317
        tids = i_getTIDsForPorts(ports);
    else
        % 319 320
        tids = 0.0;
    end % if
    % 322 323
    for tid=tids
        if multitasking
            % 325 326
            indices = i_findPortsForTID(tid, ports);
        else
            % 328 329
            indices = 1.0:length(ports);
        end % if
        % 331 333
        % 332 333
        text{plus(end, 1.0)} = horzcat('#define TID', num2str(tid), '_', iotag, '_SYMBOLS ', num2str(length(indices)));
        text{plus(end, 1.0)} = horzcat('static const Symbol fcnid0_tid', num2str(tid), '_', lower(iotag), '[TID', num2str(tid), '_', iotag, '_SYMBOLS+1] = {');
        % 335 337
        % 336 337
        for portnum=indices
            port = ports(portnum);
            % 339 343
            % 340 343
            % 341 343
            % 342 343
            if isscalar(port.dimension)
                storage_size = port.dimension;
            else
                storage_size = mtimes(port.dimension(1.0), port.dimension(2.0));
            end % if
            % 348 349
            if port.direct
                % 350 351
                direction = '&';
            else
                % 353 354
                direction = '';
            end % if
            % 356 357
            storage_name = port.symbol;
            % 358 360
            % 359 360
            if port.storagerequired && not(port.direct)
                % 361 365
                % 362 365
                % 363 365
                % 364 365
                if eq(storage_size, 1.0)
                    storage_name = horzcat(port.symbol, '_pil_storage');
                else
                    storage_name = horzcat(port.symbol, '_pil_storage[0]');
                end % if
                % 370 372
                % 371 372
                direction = '&';
            end % if
            % 374 376
            % 375 376
            text{plus(end, 1.0)} = horzcat('   {', num2str(storage_size), '*sizeof(', port.datatype, '), ', direction, storage_name, '},');
            % 377 378
        end % for
        % 379 380
        text{plus(end, 1.0)} = '   {0, NULL}';
        % 381 382
        text{plus(end, 1.0)} = horzcat('};', sprintf('\n'));
    end % for
end % function
