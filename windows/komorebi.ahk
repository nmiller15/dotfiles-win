#SingleInstance Force

!s:: Run "Chrome"
!Enter:: Run "PowerShell"

!q:: Run komorebic close, , Hide
!m:: Run komorebic minimize, , Hide

; Focus windows
!h:: Run komorebic focus left, , Hide
!j:: Run komorebic focus down, , Hide
!k:: Run komorebic focus up, , Hide
!l:: Run komorebic focus right, , Hide
!+[:: Run komorebic cycle-focus previous , , Hide
!+]:: Run komorebic cycle-focus next , , Hide

; Move windows
!+h:: Run komorebic move left, , Hide
!+j:: Run komorebic move down, , Hide
!+k:: Run komorebic move up, , Hide
!+l:: Run komorebic move right, , Hide
!+Enter:: Run komorebic promote, , Hide

; Stack windows
!left:: Run komorebic stack left, , Hide
!down:: Run komorebic stack down, , Hide
!up:: Run komorebic stack up, , Hide
!right:: Run komorebic stack right, , Hide
;!oem_1:: Run komorebic unstack # oem_1 is ;, , Hide
![:: Run komorebic cycle-stack previous, , Hide
!]:: Run komorebic cycle-stack next, , Hide

; Resize
!=:: Run komorebic resize-axis horizontal increase, , Hide
!-:: Run komorebic resize-axis horizontal decrease, , Hide
!+=:: Run komorebic resize-axis vertical increase, , Hide
!+-:: Run komorebic resize-axis vertical decrease, , Hide

; Manipulate windows
!t:: Run komorebic toggle-float, , Hide
!+f:: Run komorebic toggle-monocle, , Hide

; Window manager options
!+r:: Run komorebic retile, , Hide
!p:: Run komorebic toggle-pause, , Hide

; Layouts
!x:: Run komorebic flip-layout horizontal, , Hide
!y:: Run komorebic flip-layout vertical, , Hide

; Workspaces
!1:: Run komorebic focus-workspace 0, , Hide
!2:: Run komorebic focus-workspace 1, , Hide
!3:: Run komorebic focus-workspace 2, , Hide
!4:: Run komorebic focus-workspace 3, , Hide
!5:: Run komorebic focus-workspace 4, , Hide
!6:: Run komorebic focus-workspace 5, , Hide
!7:: Run komorebic focus-workspace 6, , Hide
!8:: Run komorebic focus-workspace 7, , Hide
!9:: Run komorebic focus-workspace 8, , Hide
!0:: Run komorebic focus-workspace 9, , Hide

; Move windows across workspaces
!+1:: Run komorebic move-to-workspace 0, , Hide
!+2:: Run komorebic move-to-workspace 1, , Hide
!+3:: Run komorebic move-to-workspace 2, , Hide
!+4:: Run komorebic move-to-workspace 3, , Hide
!+5:: Run komorebic move-to-workspace 4, , Hide
!+6:: Run komorebic move-to-workspace 5, , Hide
!+7:: Run komorebic move-to-workspace 6, , Hide
!+8:: Run komorebic move-to-workspace 7, , Hide
!+9:: Run komorebic move-to-workspace 8, , Hide
!+0:: Run komorebic move-to-workspace 9, , Hide
