function [A, B, C, D, sv, src, out, circ2ssInfo, EquivalentCircuit] = psb2sys(psbinfo, commandLine, silent, fid_outfile)
    % 1 39
    % 2 39
    % 3 39
    % 4 39
    % 5 39
    % 6 39
    % 7 39
    % 8 39
    % 9 39
    % 10 39
    % 11 39
    % 12 39
    % 13 39
    % 14 39
    % 15 39
    % 16 39
    % 17 39
    % 18 39
    % 19 39
    % 20 39
    % 21 39
    % 22 39
    % 23 39
    % 24 39
    % 25 39
    % 26 39
    % 27 39
    % 28 39
    % 29 39
    % 30 39
    % 31 39
    % 32 39
    % 33 39
    % 34 39
    % 35 39
    % 36 39
    % 37 39
    % 38 39
    if not(silent)
        disp('Computing state-space representation of linear electrical circuit ...');
    end % if
    % 42 45
    % 43 45
    % 44 45
    [data, Y, names, srcnames, outnames, orgEdgeNbrs, idxSrc, idxOut, circ2ssInfo, Lmut, psbinfo] = psb1topsb2(psbinfo, commandLine, fid_outfile);
    % 46 48
    % 47 48
    nodes = unique(data(:, 3.0:4.0));
    % 49 50
    if all(eq(size(nodes), [1.0 2.0]))
        nodes = ctranspose(nodes);
    end % if
    % 53 54
    if any(ne(ctranspose(nodes), 0.0:minus(length(nodes), 1.0)))
        message = horzcat('Bad node assigment, nodes are not consecutively ', 'numbered. Nodes obtained are ', num2str(ctranspose(nodes)));
        Erreur.message = message;
        Erreur.identifier = 'SimPowerSystems:psb2sys:BadNodeAssignment';
        psberror(Erreur);
    end % if
    % 60 62
    % 61 62
    [A, B, C, D, sv, src, out, qty, circ2ssInfo, EquivalentCircuit] = getABCD(data, Y, names, srcnames, outnames, orgEdgeNbrs, idxSrc, idxOut, commandLine, silent, psbinfo, circ2ssInfo, Lmut, fid_outfile);
    % 63 69
    % 64 69
    % 65 69
    % 66 69
    % 67 69
    % 68 69
    A = full(A);
    B = full(B);
    C = full(C);
    D = full(D);
end % function
