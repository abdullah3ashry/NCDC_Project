(globals
    version = 3
    io_order = clockwise
    space = 10
)

(iopad
    ; ==================================================
    ; Corner Pads
    ; ==================================================
    (topleft
        (inst name="CornerCell1" cell=PCORNER orientation=R270 place_status=fixed)
    )
    (topright
        (inst name="CornerCell2" cell=PCORNER orientation=R180 place_status=fixed)
    )
    (bottomright
        (inst name="CornerCell3" cell=PCORNER orientation=R90 place_status=fixed)
    )
    (bottomleft
        (inst name="CornerCell4" cell=PCORNER orientation=R0 place_status=fixed)
    )

    ; ==================================================
    ; Left Edge: A[7:0] + Reset + Power
    ; ==================================================
    (left
        (inst name="A_inst0" cell=PDDW16DGZ place_status=fixed)
        (inst name="A_inst1" cell=PDDW16DGZ place_status=fixed)
        (inst name="A_inst2" cell=PDDW16DGZ place_status=fixed)
        (inst name="PVDDL"   cell=PVDD1DGZ   place_status=fixed) ; Power
        (inst name="A_inst3" cell=PDDW16DGZ place_status=fixed)
        (inst name="A_inst4" cell=PDDW16DGZ place_status=fixed)
        (inst name="A_inst5" cell=PDDW16DGZ place_status=fixed)
        (inst name="PVSSL"   cell=PVSS1DGZ   place_status=fixed) ; Ground
        (inst name="A_inst6" cell=PDDW16DGZ place_status=fixed)
        (inst name="A_inst7" cell=PDDW16DGZ place_status=fixed)
        (inst name="rst_inst" cell=PDDW16DGZ place_status=fixed)
    )

    ; ==================================================
    ; Top Edge: B[7:0] + Sel[1:0] + Power
    ; ==================================================
    (top
        (inst name="B_inst0" cell=PDDW16DGZ place_status=fixed)
        (inst name="B_inst1" cell=PDDW16DGZ place_status=fixed)
        (inst name="B_inst2" cell=PDDW16DGZ place_status=fixed)
        (inst name="PVDDT"   cell=PVDD1DGZ   place_status=fixed) ; Power
        (inst name="B_inst3" cell=PDDW16DGZ place_status=fixed)
        (inst name="B_inst4" cell=PDDW16DGZ place_status=fixed)
        (inst name="B_inst5" cell=PDDW16DGZ place_status=fixed)
        (inst name="PVSST"   cell=PVSS1DGZ   place_status=fixed) ; Ground
        (inst name="B_inst6" cell=PDDW16DGZ place_status=fixed)
        (inst name="B_inst7" cell=PDDW16DGZ place_status=fixed)
        (inst name="sel_inst0" cell=PDDW16DGZ place_status=fixed)
        (inst name="sel_inst1" cell=PDDW16DGZ place_status=fixed)
    )

    ; ==================================================
    ; Right Edge: Out[7:0] + Power
    ; ==================================================
    (right
        (inst name="out_inst0" cell=PDDW16DGZ place_status=fixed)
        (inst name="out_inst1" cell=PDDW16DGZ place_status=fixed)
        (inst name="PVDDR"     cell=PVDD1DGZ   place_status=fixed) ; Power
        (inst name="out_inst2" cell=PDDW16DGZ place_status=fixed)
        (inst name="out_inst3" cell=PDDW16DGZ place_status=fixed)
        (inst name="out_inst4" cell=PDDW16DGZ place_status=fixed)
        (inst name="PVSSR"     cell=PVSS1DGZ   place_status=fixed) ; Ground
        (inst name="out_inst5" cell=PDDW16DGZ place_status=fixed)
        (inst name="out_inst6" cell=PDDW16DGZ place_status=fixed)
        (inst name="out_inst7" cell=PDDW16DGZ place_status=fixed)
    )

    ; ==================================================
    ; Bottom Edge: Clock + Power
    ; ==================================================
    (bottom
        (inst name="PVDDB"   cell=PVDD1DGZ   place_status=fixed) ; Power
        (inst name="clk_pad" cell=PDXOE3DG   place_status=fixed)
        (inst name="PVSSB"   cell=PVSS1DGZ   place_status=fixed) ; Ground
    )
)