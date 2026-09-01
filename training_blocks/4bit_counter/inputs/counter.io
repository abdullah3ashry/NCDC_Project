############################################################
# IO Assignment File (Version 2)
# For: counter(clk, reset, count[3:0])
# Notes:
#   - "version: 2" → Cadence format for IO pin placement
#   - "offset"     → minimum distance of the *first* pin 
#                    from the corresponding corner (µm)
#   - "Pin:"       → format = Pin: <name> <edge> <metal layer>
#   - Edges: N = North, E = East, S = South, W = West
#   - Distances are measured from the nearest corner 
#     along that edge (in microns).
############################################################
# Kindly view this file and try by giving different values of offset 
version: 2

# ---------- North Edge ----------
offset: 2
Pin: clk       N 1        ;# clk at 2µm from NW corner

offset: 4
Pin: reset  N 1        ;# reset at 4µm from NW corner

# ---------- East Edge ----------
offset: 3
Pin: count[0]     E 1        ;# count[0] at 3µm from NE corner

# ---------- South Edge ----------
offset: 2
Pin: count[1]  S 1        ;# count[1] at 2µm from SE corner

offset: 4
Pin: count[2]  S 1        ;# count[2] at 4µm from SE corner 

# ---------- West Edge ----------
offset: 3
Pin: count[3]  W 1        ;# count[3] at 3µm from SW corner
