PlayPCM::
	ldh a, [hROMBankBackup]
	push af
	ld a, b
	call Bankswitch
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a
.loop
	ld a, [hli]
	ld d, a
	ld a, $3
.playSingleSample
	dec a
	jr nz, .playSingleSample

REPT 7
	call LoadNextSoundClipSample
	call PlaySoundClipSample
ENDR

	call LoadNextSoundClipSample
	dec bc
	ld a, c
	or b
	jr nz, .loop
	pop af
	call Bankswitch
	ret

LoadNextSoundClipSample::
	ld a, d
	and $80
	srl a
	srl a
	ldh [rNR32], a
	sla d
	ret

PlaySoundClipSample::
	ld a, $3
.loop
	dec a
	jr nz, .loop
	ret
	