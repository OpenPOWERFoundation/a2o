# save/restore for 32b libc

.macro GLOBAL n
   .type       \n,@function
	.global     \n
\n:
.endm

# saves

GLOBAL _savegpr_31
GLOBAL _save32gpr_31
	stw	31,-4(11)
	blr

# restores

GLOBAL _restgpr_16_x
GLOBAL _rest32gpr_16_x
	lwz	16,-64(11)

GLOBAL _restgpr_17_x
GLOBAL _rest32gpr_17_x
	lwz	17,-60(11)

GLOBAL _restgpr_18_x
GLOBAL _rest32gpr_18_x
	lwz	18,-56(11)

GLOBAL _restgpr_19_x
GLOBAL _rest32gpr_19_x
	lwz	19,-52(11)

GLOBAL _restgpr_20_x
GLOBAL _rest32gpr_20_x
	lwz	20,-48(11)

GLOBAL _restgpr_21_x
GLOBAL _rest32gpr_21_x
	lwz	21,-44(11)

GLOBAL _restgpr_22_x
GLOBAL _rest32gpr_22_x
	lwz	22,-40(11)

GLOBAL _restgpr_23_x
GLOBAL _rest32gpr_23_x
	lwz	23,-36(11)

GLOBAL _restgpr_24_x
GLOBAL _rest32gpr_24_x
	lwz	24,-32(11)

GLOBAL _restgpr_25_x
GLOBAL _rest32gpr_25_x
	lwz	25,-28(11)

GLOBAL _restgpr_26_x
GLOBAL _rest32gpr_26_x
	lwz	26,-24(11)

GLOBAL _restgpr_27_x
GLOBAL _rest32gpr_27_x
	lwz	27,-20(11)

GLOBAL _restgpr_28_x
GLOBAL _rest32gpr_28_x
	lwz	28,-16(11)

GLOBAL _restgpr_29_x
GLOBAL _rest32gpr_29_x
	lwz	29,-12(11)

GLOBAL _restgpr_30_x
GLOBAL _rest32gpr_30_x
	lwz	30,-8(11)

GLOBAL _restgpr_31_x
GLOBAL _rest32gpr_31_x
	lwz	0,4(11)
	lwz	31,-4(11)
	mtlr	0
	mr	   1,11
	blr

