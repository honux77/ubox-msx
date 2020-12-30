all: msx-lib-ref.html spman-lib-ref.html mplayer-lib-ref.html

msx-lib-ref.html: ../include/ubox.h ../tools/hdoc.py footer.md header.html
	../tools/hdoc.py --footer footer.md "ubox.lib reference" < ../include/ubox.h > reference.ubox.md
	pandoc -s -t html5 -c water.css -c monokai.css --toc --no-highlight -F ../tools/pandocfilter-pygments.py -B header.html reference.ubox.md -o ubox-lib-ref.html

spman-lib-ref.html: ../include/spman.h ../tools/hdoc.py footer.md spman.md header.html
	../tools/hdoc.py --header spman.md --footer footer.md "spman.lib reference" < ../include/spman.h > reference.spman.md
	pandoc -s -t html5 -c water.css -c monokai.css --toc --no-highlight -F ../tools/pandocfilter-pygments.py -B header.html reference.spman.md -o spman-lib-ref.html

mplayer-lib-ref.html: ../include/mplayer.h ../tools/hdoc.py footer.md mplayer.md header.html
	../tools/hdoc.py --header mplayer.md --footer footer.md "mplayer.lib reference" < ../include/mplayer.h > reference.mplayer.md
	pandoc -s -t html5 -c water.css -c monokai.css --toc --no-highlight -F ../tools/pandocfilter-pygments.py -B header.html reference.mplayer.md -o mplayer-lib-ref.html

clean:
	rm -f ubox-lib-ref.html spman-lib-ref.html mplayer-lib-ref.html reference.ubox.md reference.spman.md reference.mplayer.md

.PHONY: clean all
