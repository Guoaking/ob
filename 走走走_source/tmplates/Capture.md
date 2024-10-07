
<%*
let file = tp.file.find_tfile(tp.date.now("YYYY-MM-DD"))
if (!file) {
new Notification("No Daily Note Found!")
await app.vault.create("01_流水/"+ tp.date.now("YYYY-MM-DD") + ".md", "test")
file = tp.file.find_tfile(tp.date.now("YYYY-MM-DD"))
const loggedItem = await tp.system.prompt("什么问题?")
const  time = tp.date.now("YYYY-MM-DD")
const content = (await app.vault.read(file)).split("\n")
const index = content.indexOf("### 今天发生了什么? ")
content.splice(index + 1, 0 , `- ${time} - ${loggedItem}`)
await app.vault.modify(file, content.join("\n"))
return
}  
const loggedItem = await tp.system.prompt("什么问题?")
const  time = tp.date.now("YYYY-MM-DD")
const content = (await app.vault.read(file)).split("\n")
const index = content.indexOf("### 今天发生了什么? ")
content.splice(index + 1, 0 , `- ${time} - ${loggedItem}`)
await app.vault.modify(file, content.join("\n"))
-%>
