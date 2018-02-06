set theAddress to ""
tell application "Mail"
	set userName to short user name of (system info)
	set theSubject to "Message Report"
	set theContent to "Messages Compiled into Zip from '" & userName & "' :"
	set theAttachmentFile to "Users:" & userName & ":ArchiveMessages.zip"
	set msg to make new outgoing message with properties {subject:theSubject, content:theContent, visible:true}
	tell msg to make new to recipient at end of every to recipient with properties {address:theAddress}
	tell msg to make new attachment with properties {file name:theAttachmentFile as alias}
	delay 2
	send msg
end tell
