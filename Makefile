spec:=ansible-collection-ansible-windows

srpm:
	cp ./build_ignore.patch $(shell rpmbuild --eval %{_sourcedir})
	@set -e; rpmbuild -bs --define "_disable_source_fetch 0" $(spec)
ifdef outdir
	cp `rpmbuild --eval "%{_topdir}"`/SRPMS/* $(outdir)
endif
