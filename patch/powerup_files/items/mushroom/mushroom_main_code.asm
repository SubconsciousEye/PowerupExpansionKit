;##################################################################################################
;# Item: Super Mushroom
;# Author: Nintendo
;# Description: Default powerup item for Big Mario.

    lda #$01
    pha 
    plb 
    jml $01C371|!bank       ; while this may look dumb and slow, it allows easy editing if needed