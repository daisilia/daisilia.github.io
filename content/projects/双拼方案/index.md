---
title: "双拼方案"
date: 2023-08-26T14:56:26+08:00
lastmod: 2023-08-26T15:00:50+08:00
comments: true
math: false
---

{{< figure src="双拼方案.svg" embed=true title="双拼方案" >}}

<!--more-->

```yaml
translator:
  dictionary: alohaim
  prism: alohaim
  enable_sentence: true
  enable_user_dict: true
  initial_quality: 1
  preedit_format:
    - "xform/(^|[ '])v/$1SH/"
    - "xform/(^|[ '])i/$1ZH/"
    - "xform/(^|[ '])u/$1CH/"
    - xform/([xjylqmpnb])g/\U$1IN/
    - xform/(SH|y|f|d|CH|r|h|ZH|w|g|b|m|p|t|l|c|k|s|z|n|z|a)z/\U$1ANG/
    - xform/(ZH|c|y|d|t|g|CH|l|k|h|z|r|s|n|o)l/\U$1ONG/
    - xform/([xqj])l/\U$1IONG/
    - xform/([xljqn])h/\U$1IANG/
    - xform/(g|SH|ZH|h|k|CH)h/\U$1UANG/
    - xform/(n|SH|CH|ZH|f|d|g|l|m|c|p|r|h|z|t|s|b|k|w|e)j/\U$1ENG/
    - xform/([jqmdtybpxln])c/\U$1ING/
    - xform/(j|y|ZH|l|d|q|c|SH|s|CH|h|x|z|k|g|t|r|n)n/\U$1UN/
    - xform/(r|m|SH|h|ZH|w|b|f|z|g|CH|k|s|p|n|c|d)d/\U$1EN/
    - xform/(k|r|d|y|s|g|ZH|n|w|SH|f|m|b|CH|l|t|h|c|z|p)q/\U$1AN/
    - xform/([tmxdqnjblp])p/\U$1IAN/
    - xform/(q|g|y|ZH|s|CH|h|d|t|l|x|j|r|k|n|z|c|SH)b/\U$1UAN/
    - xform/(SH|g|d|s|z|h|l|c|r|t|ZH|n|k|CH)o/\U$1UO/
    - xform/(d|y|h|l|g|SH|ZH|z|b|p|n|CH|k|m|c|t|s|r)x/\U$1AO/
    - xform/([xjbtdlpmqnf])r/\U$1IAO/
    - xform/(z|l|h|k|c|b|w|t|d|g|p|m|s|n|ZH|CH|SH)s/\U$1AI/
    - xform/(y|h|d|SH|t|z|k|ZH|g|l|f|r|m|CH|c|s|p|n)w/\U$1OU/
    - xform/([jlqxndm])t/\U$1IU/
    - xform/([xjqd])v/\U$1IA/
    - xform/(h|ZH|g|k|SH|r|CH)v/\U$1UA/
    - xform/(m|w|b|g|f|n|h|SH|l|p|z|ZH|d)k/\U$1EI/
    - xform/(h|d|z|SH|s|g|ZH|t|CH|r|c|k)f/\U$1UI/
    - xform/([xqyj])f/\U$1UE/
    - xform/([ln])f/\U$1VE/
    - xform/([xbjqtlmdnp])m/\U$1IE/
    - xform/(k|g|h|SH|ZH|CH)y/\U$1UAI/
    - xform/aa/A'/
    - xform/ee/E'/
    - xform/oo/O'/
    - xform/AANG/ANG/
    - xform/EENG/ENG/
    - xform/OONG/ONG/
    - xform/([qxyj])v/$1u/
    - xform/([nl])v/$1ü/
    - xlit/ABCDEFGHIJKLMNOPQRSTUVWXYZ/abcdefghijklmnopqrstuvwxyz/
```

```yaml
speller:
  alphabet: zyxwvutsrqponmlkjihgfedcbaZYXWVUTSRQPONMLKJIHGFEDCBA
  auto_select: true
  delimiter: " '"
  algebra:
    - xform/^([aoe])(ng)?$/$1$1$2/
    - xform/^a([ion])$/a\U$1/
    - xform/^e([rn])$/e\U$1/
    - xform/^o([u])$/o\U$1/
    - xform/[iu]ang$/H/
    - xform/ang$/Z/
    - xform/uan$/B/
    - xform/ian$/P/
    - xform/an$/Q/
    - xform/uai$/Y/
    - xform/ai$/S/
    - xform/iao$/R/
    - xform/ao$/X/
    - xform/eng$/J/
    - xform/en$/D/
    - xform/i?ong$/L/
    - xform/un$/N/
    - xform/in$/G/
    - xform/ei$/K/
    - xform/ie$/M/
    - xform/ou$/W/
    - xform/uo$/O/
    - xform/iu$/T/
    - xform/[iu]a$/V/
    - xform/ing$/C/
    - xform/(ue|ve|ui)$/F/
    - xform/^zh/I/
    - xform/^sh/V/
    - xform/^ch/U/
    - xlit/ABCDEFGHIJKLMNOPQRSTUVWXYZ/abcdefghijklmnopqrstuvwxyz/
```

