{if:{args:1}==info|
  {embed:{"title": "Vocoder4 Rewritten", "description": "Credits:\n bconex - rewriting Vocoder4\nunknown user - creating og Vocoder4"}}
  {return}
}

{=(has_attach):{if:{attachment}!=|1|0}}
{=(has_url):{if:{regex:(https?://):{args:1}}!=|1|0}}

{if:{has_attach}{has_url}==00|⚠️ | invalid url/no url was detected!{return}}
{if:{has_attach}{has_url}==01|⚠️ | no media uploaded.{return}}
{if:{has_attach}{has_url}==10|⚠️ | invalid url/no url was detected!{return}}

✅ videos are done!
-# here’s them video:

{load:{attachment}}
{load:{args:1}}
{catch:failed to render video: process job took more than 30s, process job halted.}
{ffmpeg: -i {file:1} -stream_loop -1 -i {file:2} -filter_complex "[0:a]aresample=44100,volume=0.015,highpass=0,acrusher=bits=32:samples=1:mix=1,aderivative,lowpass=3200,rubberband=pitch=2^(0/12)[mod];[1:a]aresample=320000[carr];[mod][carr]anlms=out_mode=e:order=4800:mu=1:leakage=0.0015:eps=0.005:precision=float[voc];[voc]volume=32,aphaseshift=shift=1:order=16,aphaseshift=shift=1:order=16,aphaseshift=shift=1:order=16,aphaseshift=shift=1:order=16,aphaseshift=shift=1:order=16,aphaseshift=shift=1:order=16,aphaseshift=shift=1:order=16,aphaseshift=shift=1:order=16,aphaseshift=shift=1:order=16,aphaseshift=shift=1:order=16[a]" -map 0:v? -map "[a]" -c:v copy -ac 1 -c:a aac -ar 44100 -shortest -t 30}
