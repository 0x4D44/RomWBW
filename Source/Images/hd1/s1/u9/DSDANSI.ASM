	org	300h

; (C) COPYRIGHT 1984, 1985 SOFT ADVANCES
; ALL RIGHTS RESERVED

PAT$ORG	equ	$

; This is the terminal dependent section of DSD

; Soft Advances
; P.O. Box 49473
; Austin, TX  78765
; 512-478-4763

; ALWAYS MAKE BACKUP COPIES FIRST.

; TO CONFIGURE DSD FOR YOUR TERMINAL, MODIFY THIS SOURCE FILE
; TO CONFORM TO THE REQUIREMENTS OF YOUR TERMINAL THEN ASSEMBLE
; WITH ASM AND INCORPORATE INTO DSD.COM WITH DDT.

; A>ed dsdpat.asm
; *
;
; A>asm dsdpat
;
; A>ddt dsd.com
; -idsdpat.hex
; -r
; -^C
;
; A>save xx DSD.COM	; XX IS DERIVED FROM DDT'S NEXT LOAD ADDRESS
;
; A>dsd
;

; Within this source file the term "string" refers to a data
; structure of the form:
;
; <BYTE COUNT> <BYTE1> <BYTE2> ... <BYTEn>
;
; Where the eight bit value <BYTE COUNT> is from zero to the stated
; maximum and <BYTEx> is an eight bit character.  This string may
; contain any character including nulls or characters with the
; parity bit on or off.  If a certain string is not required by
; you terminal, set it to an empty string by using a byte count
; of zero.

; The INITIALIZATION STRING is the first thing sent to the console
; after the copyright notice.  It is a maximum of 15 characters.
PAT$IS	db	0			; Byte count
	db	'HELLO'

	org	PAT$IS+16
; The DE-INITIALIZATION STRING is sent to the terminal just
; before DSD returns control to CP/M.  Maximum of 15 chrs.
PAT$DS	db	0			; Byte count
	db	'GOODBYE'

	org	PAT$DS+16
; The ERASE SCREEN string is used to erase the entire screen
; leaving the cursor in the upper left-hand corner of the
; display.  Max of 15 chrs.
PAT$ES	db	4			; Byte count
	db	27,'[2J'		; ANSI erase screen

	org	PAT$ES+16
; Most terminals use a single absolute cusor positioning command
; instead of seperate row and column commands.  To configure DSD
; to drive one of these terminals you must consider the single
; command sequence as two or three seperate sequences.  This is
; best illustrated by some examples:

; The VT52 CRT uses the cursor addressing sequence:
;
;	<escape>Y<row+32><column+32>
;
; To configure DSD to drive this terminal, set the ROW POSITIONING
; string to "<escape>Y" and use null COLUMN and SUFFIX strings.
; Also, set ROW FIRST and use ROW and COLUMN BIASES of 32.  Reset
; DECIMAL VALUES.

; For an ADM3a CRT, substitue "=" for "Y" in the above ROW
; ADDRESSING string.

; ANSI terminals require the cursor addressing sequence:
;
;	<escape>[<row in ASCII>;<column in ASCII>H
;
; For example, to set the cursor to row 1 column 15 would use the
; sequence:
;
;	<escape>[1;15H
;
; For these terminals you should set the row string to "<escape>[",
; the column string to ";" and the suffix string to "H".  Make sure
; that ROW FIRST and DECIMAL VALUES are set.  The ROW and COLUMN
; BIASES are 1.
;

; Hazeltine 1500's are setup as follows:
;PAT$ES	db	2,126,28		; erase screen
;PAT$RA	db	0			; row addressing prefix
;PAT$CA	db	2,126,17		; column addressing prefix
;PAT$RF	db	0			; column first
;PAT$CB	db	0			; column bias
;PAT$RB	db	0			; row bias
;PAT$DND	db	126			; do not display tilde


; The ROW POSITIONING string is used to initiate a row positioning
; sequence in the terminal.  This string has a maximum length of 7
; characters.
PAT$RA	db	2			; Byte count
	db	27,'['			; Start of ANSI sequence

	org	PAT$RA+8
; The COLUMN POSITIONING string is used to initiate a column
; positioning sequence.  Maximum of 7 characters.
PAT$CA	db	1			; Byte count
	db	';'			; ANSI seperator

	org	PAT$CA+8
; The POSITIONING SUFFIX string is used to terminate a cursor
; positiong sequence.  The major use of this string is by ANSI
; standard terminals which require the single character 'H' after
; the positioning sequence.  Terminals such as the VT52 or
; ADM3a do not use this string.  Max of 7 chrs.
PAT$PS	db	1			; Byte count
	db	'H'			; ANSI suffix

	org	PAT$PS+8
; The DESTRUCTIVE SPACE string is used instead of a blank or space
; by DSD to erase a character at a particular position.  For most
; terminals this string is just a single space.  Max of 7 chrs.
PAT$SP	db	1			; Byte count
	db	' '

	org	PAT$SP+8
; The HIGHLIGHTED VIDEO string is used to make certain characters
; stand out on the screen. According to your personal preference,
; this might be reverse video, different intesity, underlining,
; etc. Many terminals, such as the Televideo 950, which support
; highlighted video can NOT use this feature because a character
; position is required to switch display modes. See ENABLE
; HIGHLIGHTING. Max of 7 chrs.
PAT$HV	db	4			; Byte count
	db	27,'[7m'		; ANSI reverse video

	org	pat$hv+8
; The NORMAL VIDEO string is used to restore the display of normal
; characters on the screen.  A terminal which uses a character
; position to switch to highlighted video probably also uses one to
; switch normal video and can NOT use this feature.  See
; HIGHLIGHTED VIDEO, ENABLE HIGHLIGHTING Max of 7 chrs.
PAT$NV	db	3			; Byte count
	db	27,'[m'			; Exit all attributes on ANSI

	org	pat$nv+8
; The ROW FIRST flag is set to non-zero to indicate that row is to
; preceed the column in a positioning sequence. Most terminals
; should have this flag set.
PAT$RF	db	1			; Row first if non-zero

; The DECIMAL VALUES flag if set will cause a string of decimal
; ASCII characters to replace the normal single binary character
; used to specify the row or column.  Terminals implementing the
; ANSI standard should set this flag.  Most terminals don't however.
PAT$DV	db	1			; Decimal values if non-zero

; The ROW & COLUMN BIASES are added to the absolute binary values
; of the row and column before a cursor positioning sequence is
; sent.  This occurs regardless of the value of the DECIMAL VALUES
; flag.  DSD considers the upper leftmost cursor position (home) as
; 0,0.  ANSI terminals will probably use a bias of one (1).
PAT$CB	db	1			; Column bias
PAT$RB	db	1			; Row bias

; The POSITIONING FILL COUNT & CHARACTER are used to send a single
; eight bit character up to 255 times after a cursor positioning
; sequence.  This is useful for terminals which require a delay
; after a positioning sequence.  A count of zero disables this
; function.
PAT$AF	db	0			; Positioning fill count
PAT$AC	db	0			; Positioning fill character

; The ERASE SCREEN FILL COUNT & CHARACTER are used to send a single
; eight bit character up to 255 times after an erase screen
; sequence.  This is required at higher baud rates on many
; terminals because the erase screen function is slow.  Be
; advised that some interrupt driven smart terminals with XON/XOFF
; flow control still require filling of the erase screen
; function.  Setting the fill count to zero disables this function.
PAT$EF	db	0			; Erase screen fill count
PAT$EC	db	0			; Erase screen fill character

; The POSITIONING AND/OR MASKS are applied to the binary row and
; column values after the ROW & COLUMN BIASES are added in.  The
; AND mask is applied first.  This is used on some terminals which
; set the upper bit during cursor positioning sequences.  These
; masks have NO affect on any of the positioning strings only the
; binary values.  Additionally, if DECIMAL VALUES is set, these
; masks have no function.
PAT$AM	db	255			; AND MASK
PAT$OM	db	0			; OR MASK

; The DO NOT DISPLAY character is used to prevent the display of a
; otherwise normally displayable character.  This is useful for
; certain terminals which use a displayable character as an "escape"
; character.  This value has no affect on any of the fill
; characters or positioning strings, etc.
PAT$DND	db	0			; DO NOT DISPLAY

; The ENABLE HIGHLIGHTING flag is set non-zero to enable the use
; of highlighted video to enhance certain portions of the display.
PAT$EH	db	0FFh			; ENABLE HIGHLIGHTING if non-zero


; *** WARNING ***		*** WARNING ***

; The following section of this source overlays values which
; configure several operating parameters of DSD.  This code is
; provided strictly for the convience of experienced assembly
; language programmers.  Modifications to this section of code are
; NOT supported by Soft Advances and are NOT guaranteed to work.
; Exercise caution in modifying these locations because errors
; could cause DSD to crash in an unpredictable manner.

; You are advised to make a backup copy of this source before
; modifying making any changes.

; *** WARNING ***		*** WARNING ***

	org	PAT$ORG+128

; PATV$VER is the version number of DSD to which this patch file
; belongs.  Do NOT modify this location.
PAT$VER	db	221
	db	'  '	; indicate no ZCPR3

; ISP is the initial user stack pointer; this is the initial
; value of the stack pointer for the program being debugged.  A
; value of zero results in DSD using a stack allocated within DSD.
; USS is the size of the internal stack which is 100 bytes.  If you
; want to change the initial SP then be sure to change the stack
; size accordingly. For example, DDT has an initial SP of 100h
; which results in a stack size of 80h.  However, this is a poor
; choice for a stack because it conflicts with CP/M's default DMA
; buffer and can result in system crashes.
PAT$ISP	dw	0		; Initial Stack Pointer
PAT$USS	dw	100		; User Stack Size

; DSS is the default stack size.  If either a SPHL or LXI SP,xxxx
; instruction is executed during simulation, the value at this
; location is used as the stack size.  Notice that is different
; from the size of the initial stack above.
PAT$DSS	dw	1000h

; The following byte defines a mask which is applied to bytes
; before they are displayed in the ASCII portion of the memory
; display.  The only other reasonable value is 7Fh which causes
; characters with the parity bit ON to be displayed.
PAT$ADM	db	255		; Ascii Display Mask

; The following byte defines a mask which will be applied to
; the low order byte of the memory display addresses.  It can
; be used to force alignment of the memory displays to a 16
; byte boundary for which the mask would be 0F0h.
PAT$MAM	db	0FFh		; Memory address mask

; After searching on the current disk and user for the help file,
; DSD80 will try one other disk/user.  The following locations
; select this area.
PAT$AHD	db	1		; Alternate help disk, A:=1, B:=2, etc
PAT$AHU	db	0		; Alternate help user code

; PAT$BI defines a single byte instruction used as in-code
; breakpoint.  This instruction, which should be one of the eight
; restart instructions, must perform a "CALL" to the address
; specified in PAT$BL.  Insure there is no conflict with the
; restart associated with PAT$ABP & PAT$ABI
PAT$BI	db	0FFh		; Breakpoint Instruction (RST 7)
PAT$BL	dw	38h		; Breakpoint Location

; PAT$ABP presets the arbitrary breakpoint test routine.  This
; routine is called the first time you issue the meta-A command.
; You MUST be very careful not to make this routine any longer than
; seven bytes.  The only reasons you may have to make changes to
; this routine are: (1) to change the restart instruction used or
; (2) to disable the routine altogether.  THIS ROUTINE CANNOT EXCEED
; A MAXIMUM OF SIXTEEN (16) BYTES IN LENGTH!
PAT$ABP	nop			; Change this to RETurn to disable
	mvi	a,0C9h		; Set RETurn instruction at RST
	sta	28h		;  entry point (28h is for RST 5)
	ret

	org	PAT$ABP+16
; PAT$ABI specifies the restart instruction used by the simulator
; to call one of your routines before an instruction is executed.
; If you want to stop simulation, return with the carry flag set.
; The values of the other registers is not important.  Upon entry
; to your routine the following registers are set: Cf=0 (carry
; flag); HL=ptr to registers; DE=program counter.  The registers
; are kept in memory as follows: PSW, BC, DE, HL, SP, PC, IX, IY.
; You should avoid modifying the contents of any registers from
; your routines.  It may or may not work (i.e., your on your own).
PAT$ABI	db	0EFh		; Which restart instruction to use (RST 5)

; PAT$BSQ specifies the number of 256 byte pages DSD80 allocates
; for the backstep queue.  A value of zero disables this feature.
; Set PAT$BSE non-zero if you want DSD80 to allocate space for the
; queue during initialization.  If 0, space is allocated the 1st time
; the backstep command is issued, ~B.
PAT$BSE	db	0		; #0 to preallocate backstep queue
PAT$BSQ	db	8		; no. of 256 byte pages for backstep queue

; The following locations define the USER DISPLAY INTERFACE.  This
; feature may be used to write custom displays.  Be warned that
; DSD80 does very little error checking and you can easily confuse
; the display or crash the system.   Studying the examples provided
; is STRONGLY recommended.  The "window" for the user display is
; 9 rows by 79 columns.  Exceeding either of these limits results
; in a confused display, a crash or both.
;
; When the user display is turned ON via ~U, DSD80 will call your
; driver frequently to update the display.  DSD80 wants to update
; the display after a control character is entered or after stepping
; an instruction.
;
; Set PAT$UDE non-zero to enable the user display.  Set PAT$UDL to
; the address where DSD80 is to plant a JMP to the display function
; processor.  This address could be a restart vector in which case
; your display driver would make calls to DSD80 via that restart
; instruction OR it could be some known address within your program
; in which case you would CALL that address.
; 
; PAT$UDD is the address of your display driver.  Using a "global"
; entry point for your driver would make life easier.  For example,
; put a JMP to your driver at location 0106h and specify 0106h as
; your driver address.
; 
; PAT$MXC and PAT$MYC are the address of two routines you may
; invoke from the DSD80 commands ~X and ~Y.  These routines can do
; whatever you want.  On entry to your routines, DE has the address
; of DSD80's copy of the registers, see the arbitrary breakpoint
; for more details.  PAT$UDE must be non-zero to use ~X & ~Y.
;
PAT$UDE	db	0		; Non-zero to enable this feature
PAT$UDL	dw	0103h		; Function Dispatch Address
PAT$UDD	dw	0106h		; User Display Driver Address
PAT$MXC	dw	0109h		; Meta X Command Address
PAT$MYC	dw	010Ch		; Meta Y command Address

; Use the following locations to configure DSD80 for an ALTERNATE
; CONSOLE.  Meta C toggles whether debugger output goes to the
; initial console or the alternate.  PAT$ACE defines access to the
; alternate console: 0=none; 1=specify subroutine addresses for
; input,output&status; 2=same as 1 but DSD80 comes up using
; alternate console; 3=use IO Byte [preferred]. DSD80 initially
; uses the standard console (except if PAT$ACE=2) until meta-C is
; entered.
;
; The easiest way to use an alt console is to use the IO byte,
; assuming that your BIOS supports this feature.  The correct value
; for the IO Byte is system dependent, however, I have found either
; 1 or 0 to work most of the time.
;
; If your BIOS doesn't support the IO Byte or you are trying to run
; DSD on a non-CP/M machine, you may specify your own I/O routines:
; PAT$BCI returns the next character from the keyboard in A; all
; other registers preserved. PAT$BCO displays the character in A;
; all registers preserved.  PAT$BCS returns with the zero flag ON
; if NO characters are available; all registers except A preserved.
; Notice that these routines differ from the definitions for the
; CP/M BIOS and that you are specifying only the address of the
; routine.  DO NOT PUT ANY CODE HERE.
;
PAT$ACE	db	0		; Alternate console enable
PAT$IOB	db	1		; Alternate IO Byte
PAT$BCI	dw	0		; Alternate Console Input Address
PAT$BCO	dw	0		; Alternate Console Output Address
PAT$BCS	dw	0		; Alternate Console Status Address

; PAT$BMK defines the character used to backup to the previous
; location during substitute memory mode (S command).
PAT$BMK	db	'-'		; Backup Memory Keyin chr

; PAT$DMA specifies the method DSD uses for restoring the DMA
; address after a DSD command which does disk I/O (e.g., Read, Write
; or ?-Help).  Set this location to one of three values: (0) to never
; restore the DMA address (mainly for non CP/M applications), (1)
; to always restore the DMA address to 0080h, (2) to restore the
; DMA address to its last known value.  The last DMA address is
; remembered by intercepting the BDOS function calls 13:Reset Disk
; System and 26:Set DMA Address.
PAT$DMA	db	2		; Default to using BIOS intercept

; PAT$DZR defines the default Z80 register display.  The four Z80
; register displays are: 0-nothing, 1-index registers, 2-alternate
; register set (EXX), 3-alternate PSW (EXAF).  Advance this
; location with the meta-z command.
PAT$DZR	db	0		; Default display is blank

; PAT$EPM defines the initial value of the expert mode flag. Set
; this location to 0FFh to have expert mode ON initially. Expert
; mode enables the ^B, ^G & meta-A commands.
PAT$EPM	db	0		; ExPert Mode (if # 0)

; PAT$FLG defines the characters used to represent the CPU's flags
; in the register display.  You might want to change them to Z80
; style.  The 1st char of each pair is used to indicate the flag
; when it's ON, the 2nd is used to indicate when the flag is OFF.
PAT$FLG	db	'M Z   I   E N C '	; Flags

	org	PAT$FLG+16
; PAT$PCI, BCI define the characters used in the instruction
; display to indicate the locations of the program counter, and
; breakpoints, respectively.
PAT$PCI	db	'$'		; Program Counter Indicator
PAT$BPI	db	'B'		; Breakpoint indicator

; PAT$M1 and M2 define the initial values of the memory displays.
PAT$M1	dw	100h		; Memory Display One (top)
PAT$M2	dw	140h		; Memory Display Two (bottom)

; PAT$NLA determines how the Next Load Address (NLA) is set after
; loading a COM file.  If equal to zero, the NLA is changed only if
; lastest COM file was larger than previous COM files.  Thus the
; next load address always refers to the largest load address
; during a debugging session (HEX files always set the NLA in this
; fashion).  If PAT$NLA is non-zero then the next load address is
; always updated to reflect the last COM file loaded.
PAT$NLA	db	1		; Always use the lastest COM file's NLA

; OFFLIM defines the maximum offset for any displayed symbol.
; If a offset exceeds this value, no symbol is displayed.
OFFLIM	dw	512		; Symbol offset limit for display

; PAT$SBA contains the address of the local copy of the screen DSD
; uses to optimize its display cycles.  If this value is zero, DSD
; allocates memory from the TPA for this buffer.  If it is
; non-zero, DSD uses that address for its buffer.  This is
; intended mainly for memory mapped displays.  FULL SUPPORT FOR
; MEMORY MAPPED DISPLAYS IS NOT YET IMPLEMENTED.
PAT$SBA	dw	0		; Screen Buffer Address

; PAT$SCS controls how the simulator treats the SPHL or LD SP,HL
; instruction. If this flag is non-zero, the simulator thinks it is
; changing stacks when this instruction is executed.  If zero, the
; simulator assumes the stack hasn't changed.  Several C compilers
; use the SPHL instruction to adjust the stack pointer for passing
; variables and allocating space for local variables.  Many assembly
; language programs use SPHL to "initialize" their stacks.
PAT$SCS	db	255		; "stack changing" by default

; The location enables ^J single stepping.  It is off by default
; because, if and when command files are implemented, you might NOT
; want to execute an instruction of your program after every line
; of the command file.
PAT$SME	db	0		; Single Step Maybe Enable if#0 (with ^J)

; SYSBLD is where DSD builds its symbol table.  Due to the stack
; requirements of the sorting routine, a considerable amount of
; storage is required below this address in addition to enough room
; for the symbol table above this address.  The symbol table is
; moved to protected storage at the top of the TPA after it is
; built.  YOU MUST MAKE THIS AN EVEN ADDRESS.
SYMBLD	dw	400h		; Where DSD builds its symbol table
				;  it needs space below for stack
				;  during sort *** must be EVEN address ***

; These characters define the XON/XOFF hand shaking protocol.  This
; protocol can be effectively disabled by setting these locations
; to 0FFh.
PAT$XOF	db	'S'-'@'		; Chr to pause output from DSD
PAT$XON	db	'Q'-'@'		; Chr to continue output from DSD
				; *** MUST FOLLOW PAT$XOF ***
	end
