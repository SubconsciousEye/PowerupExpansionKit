;################################################
;# Physics Flags

;#  jh-- --fv
;#   - h = horizontal flag
;#   -  0 = run vanilla physics
;#   -  1 = run custom physics (skip)
;#   - j = can jump flag
;#   -  0 = run jump input (grounded)
;#   -  1 = run custom physics (skip)
;# Note that horizontal physics run *before* powerup abilities have run.
;#   - v = vertical flag
;#   -  0 = run vanilla physics
;#   -  1 = use custom physics (skip)
;#   - f = "capeflight" flag
;#   -  0 = run "capeflight" gravity
;#   -  1 = don't run physics (skip)
;# Note that vertical physics run *after* powerup abilities have run.

pushpc
    org $00D630|!bank
        jml checkjump
pullpc

checkjump:
    lda !player_physics_flags
    bmi .skipjump
    lda !player_x_speed
    bpl +
    eor #$FF : inc
+   jml $00D637|!bank
.skipjump
    jml $00D682|!bank

pushpc
    org $00D682|!bank
        jml horzphysics_check1
        nop
    org $00D622|!bank
        jml horzphysics_check0
pullpc

horzphysics:
.check0
    lda !player_physics_flags
    asl
    bmi .end_physics
    lda !player_x_speed
    beq ..return
    jml $00D626|!bank
..return
    jml $00D62D|!bank
.end_physics
    jml $00D7A4|!bank
.check1
    lda !player_physics_flags
    asl
    bmi .end_physics
    lda !13ed
    bmi ..return
    jml $00D687|!bank
..return
    jml $00D692|!bank

pushpc
    org $00D7E4|!bank
        jml vertphysics_main
        nop
    org $00D802|!bank
        jsl vertphysics_capecheck
    org $00D8E7|!bank
        jsl vertphysics_capecheck
pullpc

vertphysics:
.main
    lda !player_physics_flags
    lsr
    bcs .end_physics
    lsr
    bcs .flight
    jml $00D8CD|!bank
.end_physics
    jml $00D94E|!bank
.flight
    bne .end_physics
    ldy $1407|!addr
    bne .inflight
    jml $00D7E9|!bank
.inflight
    jml $00D824|!bank
.capecheck
    lda !player_physics_flags
    and #$02
    rtl



;################################################
;# Handles Yoshi Easy Flight

pushpc
;    org $00D8DE|!bank
;        jsl easy_yoshi_flight_flag
    org $00D8E0|!bank
        jml easy_yoshi_flight_flag
        nop
pullpc

easy_yoshi_flight_flag:
;    ldy #$02
;    phx 
    ldx !player_powerup
    lda.l .global_flags,x 
;    plx 
    eor !player_toggle_easy_yoshiflight
;    cmp #$00   ; the eor sets zero flag....
;    rtl
    tax
    jml $00D8E5|!bank

.global_flags
    !i #= 0
    while !i < !max_powerup_num
        %internal_number_to_string(!i)
        if not(stringsequal("!{powerup_!{_num}_path}", "0"))
            db (!{powerup_!{_num}_easy_yoshi_flight})^1
        else
            ;db $00
            db $01
        endif
        !i #= !i+1
    endif

