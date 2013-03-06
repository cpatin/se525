(define j (com.jcraft.jsch.JSch.))
(define sess (com.jcraft.jsch.Session.))
(define channel (com.jcraft.jsch.ChannelSftp.))
(define f (java.io.File. "/mnt/sdcard/C2.scm"))
(define fis (java.io.FileInputStream. f))
(define (main target)
	(com.jcraft.jsch.JSch.setConfig "StrictHostKeyChecking" "no")
        (.addIdentity j "/mnt/sdcard/new_rsa" "password")
	(set! sess (.getSession j "alice" "192.168.2.3" 22))
	(.connect sess)
	(set! channel (.openChannel sess "sftp"))
	(.connect channel)
	(android.util.Log.e "CSP" "defined session")
	(.put channel fis "machines/m2/C2.scm" com.jcraft.jsch.ChannelSftp.OVERWRITE$)
	(.disconnect channel)
	(.disconnect sess)
}