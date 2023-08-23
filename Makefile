install:
	python setup.py install
	make clean

uninstall:
	python setup.py uninstall

reinstall:
	make uninstall
	make install

clean:
	rm -Rf build Cactus.egg-info dist

test:
	tox

testw:
	watchmedo shell-command \
		--patterns="*.py;*.txt" \
		--recursive \
		--command='nose2 -x -s --logging-level=CRITICAL --processes=4' \
		.

alltests:
	make clean
	make uninstall
	make install
	make test

.PHONY: test