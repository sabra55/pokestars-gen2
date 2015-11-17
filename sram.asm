SRAM_Begin EQU $a000
SRAM_End   EQU $c000
GLOBAL SRAM_Begin, SRAM_End


SECTION "Scratch", SRAM, BANK [0]
sScratch::


SECTION "SRAM Bank 0", SRAM [$a600], BANK [0]

mailmsg: MACRO
\1Message:: ds $20
\1Author:: ds NAME_LENGTH
	ds 3
\1MailType:: ds 1
endm

sPartyMail::
sPartyMon1Mail:: mailmsg sPartyMon1Mail
sPartyMon2Mail:: mailmsg sPartyMon2Mail
sPartyMon3Mail:: mailmsg sPartyMon3Mail
sPartyMon4Mail:: mailmsg sPartyMon4Mail
sPartyMon5Mail:: mailmsg sPartyMon5Mail
sPartyMon6Mail:: mailmsg sPartyMon6Mail

sPartyMailBackup::
sPartyMon1MailBackup:: mailmsg sPartyMon1MailBackup
sPartyMon2MailBackup:: mailmsg sPartyMon2MailBackup
sPartyMon3MailBackup:: mailmsg sPartyMon3MailBackup
sPartyMon4MailBackup:: mailmsg sPartyMon4MailBackup
sPartyMon5MailBackup:: mailmsg sPartyMon5MailBackup
sPartyMon6MailBackup:: mailmsg sPartyMon6MailBackup

sMailboxCount:: ds 1
sMailbox::
sMailbox1:: mailmsg sMailbox1
sMailbox2:: mailmsg sMailbox2
sMailbox3:: mailmsg sMailbox3
sMailbox4:: mailmsg sMailbox4
sMailbox5:: mailmsg sMailbox5
sMailbox6:: mailmsg sMailbox6
sMailbox7:: mailmsg sMailbox7
sMailbox8:: mailmsg sMailbox8
sMailbox9:: mailmsg sMailbox9
sMailbox10:: mailmsg sMailbox10

sMailboxCountBackup:: ds 1
sMailboxBackup::
sMailbox1Backup:: mailmsg sMailbox1Backup
sMailbox2Backup:: mailmsg sMailbox2Backup
sMailbox3Backup:: mailmsg sMailbox3Backup
sMailbox4Backup:: mailmsg sMailbox4Backup
sMailbox5Backup:: mailmsg sMailbox5Backup
sMailbox6Backup:: mailmsg sMailbox6Backup
sMailbox7Backup:: mailmsg sMailbox7Backup
sMailbox8Backup:: mailmsg sMailbox8Backup
sMailbox9Backup:: mailmsg sMailbox9Backup
sMailbox10Backup:: mailmsg sMailbox10Backup

sMysteryGiftItem:: ds 1
s0_abe3:: ds 1
s0_abe4:: ds 1
s0_abe5:: ds 1
s0_abe6:: ds 10
s0_abf0:: ds 10
sMysteryGiftTimer:: ds 1
sMysteryGiftTimerStartDay:: ds 1
	ds 1
sMysteryGiftTrainerHouseFlag:: ds 1
s0_abfe:: ds 12
sMysteryGiftTrainer:: ds (1 + 1 + NUM_MOVES) * PARTY_LENGTH + 1
	ds 1
s0_abe4End::

	ds $30

s0_ac60:: ds 8
sLuckyNumberDay:: ds 1
sLuckyIDNumber:: ds 2

	ds $b200 - $ac6b

sBackupOptions:: ds OptionsEnd - Options

s0_b208:: ds 1

sBackupGameData::
sBackupPlayerData::  ds wPlayerDataEnd - wPlayerData
sBackupMapData::     ds wMapDataEnd - wMapData
sBackupPokemonData:: ds wPokemonDataEnd - wPokemonData
sBackupGameDataEnd::

; bd83
	ds $18a
; bf0d

sBackupChecksum:: ds 2
s0_bf0f:: ds 1
sStackTop:: ds 2


SECTION "SRAM Bank 1", SRAM, BANK [1]

sOptions:: ds OptionsEnd - Options

s1_a008:: ds 1 ; loaded with 99, used to check save corruption

sGameData::
sPlayerData::  ds wPlayerDataEnd - wPlayerData
sMapData::     ds wMapDataEnd - wMapData
sPokemonData:: ds wPokemonDataEnd - wPokemonData
sGameDataEnd::

; ab83
	ds $18a
; ad0d

sChecksum::   ds 2
s1_ad0f::     ds 1 ; loaded with 0x7f, used to check save corruption

; ad10
	box sBox
; b160

	ds $f4
s1_b254:: ds $c

sLinkBattleStats:: ; b260
sLinkBattleWins::   ds 2
sLinkBattleLosses:: ds 2 ; b262
sLinkBattleDraws::  ds 2 ; b264
s1_b266::
	ds 17
s1_b277::
	ds 73
sLinkBattleStatsEnd::

sHallOfFame:: ; b2c0
	ds HOF_LENGTH * NUM_HOF_TEAMS
sHallOfFameEnd::

sMobileEventIndex:: ds 1

sCrystalData::
	ds wCrystalDataEnd - wCrystalData
sMobileEventIndexBackup:: ds 1
s1_be45:: ds 1

; data of the BattleTower must be in SRAM because you can save and leave between battles
sBattleTower:: ; be46
sNrOfBeatenBattleTowerTrainers::
sbe46:: ds 1
sbe47:: ds 1
; The 7 trainers of the BattleTower are saved here, so nobody appears more than once
sBTTrainers:: ; sbe48
	ds 7
sbe4f:: ds 1
sbe50:: ds 1
; Pkmn of previous trainer
sBTPkmnOfTrainers:: ; 0xbe51
sBTPkmnPrevTrainer1::
	ds 1
sBTPkmnPrevTrainer2:: ds 1
sBTPkmnPrevTrainer3:: ds 1
; Pkmn of preprevious trainer
sBTPkmnPrevPrevTrainer1:: ds 1
sBTPkmnPrevPrevTrainer2:: ds 1
sBTPkmnPrevPrevTrainer3:: ds 1


SECTION "Boxes 1-7",  SRAM, BANK [2]
	box sBox1
	box sBox2
	box sBox3
	box sBox4
	box sBox5
	box sBox6
	box sBox7

SECTION "Boxes 8-14", SRAM, BANK [3]
	box sBox8
	box sBox9
	box sBox10
	box sBox11
	box sBox12
	box sBox13
	box sBox14
