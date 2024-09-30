---
tags:
  - cb
---


# BTC

```dataviewjs
let term = 'BTC';
dv.header(3, `${term}`)
let files = dv.pages(`"01_流水"`)
let rg1 = /!\[(?!\[).*?\]\((?!<?http:|<?https:|<?file:)(.+?\.[a-zA-Z]{3,4})\>?\)|!\[\[(.+?\.[a-zA-Z]{3,4})\|?.*?\]\]/g


function extract(str) {
  let r = [];
  str.replace(rg1, (m, p1, p2) => {
    r.push(p1 || p2)
  });
  return r[0]
}

files.map(async p => {
  console.log("path",p.file.path)
  let fc = app.metadataCache.getFileCache(app.vault.getAbstractFileByPath(p.file.path)).headings
  if (!fc) return;

  let i = fc.findIndex(p => p.level == 3 && p.heading == term)  // 获取二级且等于 term 的索引
  if (i == -1 ) {
    console.log("not find target header")
    return 
  }
  let j = i + 1;

  while (fc[j]?.level > 3) {
    j++
  }  // fc[j]存在且级数大于二跳到下个索引


  let A = (await app.vault.readRaw(p.file.path)).split('\n')  // 分块
  console.log("A0",A)
  // A = fc[j] ? A.slice(fc[i].position.end.line + 1, fc[j].position.end.line) : A.slice(fc[i].position.end.line + 1)  // 截取
  if (fc[j]) {
    console.log("no end")
    A = A.slice(fc[i].position.end.line + 1, fc[j].position.end.line)
  } else {
    console.log("end")
    A = A.slice(fc[i].position.end.line + 1)
  }
  console.log("A1",A)

  let mats = []; 
  A.map(a => { 
    for (m of a.matchAll(rg1)) {
      mats.push(m[0])
    } 
  })
  console.log("mats0",mats)
  let B = p.file.outlinks.filter(p => p.embed && !/\.md$/.test(p.path))
  // console.log("B0",B)

  B.map(b => {
    let path = b.path.split('/'); 
    let dis = /.*?(?:\|)?(.*?)(?:\|)?(\d+)$/.exec(b.display);
    let src = encodeURI(`file:${app.vault.adapter.basePath}/${b.path}`);

    // console.log("b info", path, dis, src)
    mats.map(m => {
      // console.log("m0",m) 
      let e = extract(m);
      // console.log("e0",e) 

      let boo = e.replace(/\.\//).includes('/') ? e.endsWith(path.slice(-2).join('/')) : e.endsWith(path.slice(-1))
      A.map(a => {
        // console.log("call A.map", a)
        a.replace(m, () => {
          if (boo) { 
            return dis ? `<img width='${dis[2]}' src='${src}'>` : `<img src='${src}'>` 
          } else { 
            return m 
          }
        })
      })  
    })
  }); 

  dv.paragraph(`##### ${p.file.link}\n${A.join('\n')}`)  // 合块、输出
})
```