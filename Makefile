TARGETS=alternants se 2ia gba meca gc is mat 2GU Prod
SVGs=$(addsuffix .svg,$(TARGETS))
JPGs=$(addsuffix .jpg,$(TARGETS))
PDFs=$(addsuffix .pdf,$(TARGETS))

#all: $(SVGs) $(JPGs) $(PDFs)
all : $(PDFs)
#%.svg: %.dot
#	dot -Tsvg $< > $@

#%.jpg: %.dot
#	dot -Tjpg $< > $@

%.pdf: %.dot
	sed -e 's/@BDE@/fillcolor="#f05050"/g' \
	    -e 's/@PREZ@/fillcolor="yellow"/g' \
		-e 's/@ALP@/penwidth=4 color="#7ed3ecff"/g' \
		-e 's/@MILLE@/penwidth=4 color="purple"/g' \
		-e 's/@NEAN@/penwidth=4 color="#00b7ff/g' \
	    $< | dot -Tpdf > $@

clean:
	$(RM) *.svg *.jpg *.pdf

.PHONY: $(TARGETS) clean
