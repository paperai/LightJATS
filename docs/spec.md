# LightJATS Specification

* [article](https://jats.nlm.nih.gov/archiving/tag-library/1.1d1/n-ja30.html)
    * [front](https://jats.nlm.nih.gov/archiving/tag-library/1.1d1/n-j6s0.html)
        * [journal-title](https://jats.nlm.nih.gov/archiving/tag-library/1.1d1/n-e630.html)
        * year
        * [article-title](https://jats.nlm.nih.gov/archiving/tag-library/1.1d1/n-e630.html)
        * [abstract](https://jats.nlm.nih.gov/archiving/tag-library/1.1d1/n-ba20.html)
        * ~~[contrib[@contrib-type="author"]](https://jats.nlm.nih.gov/archiving/tag-library/1.1d1/n-n3w0.html)~~ → rename to `author`
            * [prefix](https://jats.nlm.nih.gov/archiving/tag-library/1.1d1/n-jxr0.html)
            * [given-names](https://jats.nlm.nih.gov/archiving/tag-library/1.1d1/n-fwt0.html)
            * [surname](https://jats.nlm.nih.gov/archiving/tag-library/1.1d1/n-sg90.html)
            * [suffix](https://jats.nlm.nih.gov/archiving/tag-library/1.1d1/n-djb0.html)
    * [body](https://jats.nlm.nih.gov/archiving/tag-library/1.1d1/n-jn50.html)
        * ~~[def-list](https://jats.nlm.nih.gov/archiving/tag-library/1.1d1/n-4hx0.html)~~ → merge with `list`
        * [disp-formula](https://jats.nlm.nih.gov/archiving/tag-library/1.1d1/n-tmx0.html)
            * [mml:math](https://jats.nlm.nih.gov/archiving/tag-library/1.1d1/n-cgn0.html)
            * [label](https://jats.nlm.nih.gov/archiving/tag-library/1.1d1/n-sqf0.html)
        * [disp-formula-group](https://jats.nlm.nih.gov/archiving/tag-library/1.1d1/n-v8v0.html)
            * [label](https://jats.nlm.nih.gov/archiving/tag-library/1.1d1/n-sqf0.html)
            * [caption](https://jats.nlm.nih.gov/archiving/tag-library/1.1d1/n-d580.html)
                * ~~[title](https://jats.nlm.nih.gov/archiving/tag-library/1.1d1/n-7fz0.html)~~ → merge with `caption`
                * ~~[p](https://jats.nlm.nih.gov/archiving/tag-library/1.1d1/n-7xd0.html)~~ → merge with `caption`
        * [list](https://jats.nlm.nih.gov/archiving/tag-library/1.1d1/n-64g0.html)
            * ~~[label](https://jats.nlm.nih.gov/archiving/tag-library/1.1d1/n-sqf0.html)~~ → merge with `title`
            * [title](https://jats.nlm.nih.gov/archiving/tag-library/1.1d1/n-7fz0.html)
            * [list-item](https://jats.nlm.nih.gov/archiving/tag-library/1.1d1/n-ctg0.html)
        * [p](https://jats.nlm.nih.gov/archiving/tag-library/1.1d1/n-7xd0.html)
        * [sec](https://jats.nlm.nih.gov/archiving/tag-library/1.1d1/n-gby0.html)
            * ~~[label](https://jats.nlm.nih.gov/archiving/tag-library/1.1d1/n-sqf0.html)~~ → merge with `title`
            * [title](https://jats.nlm.nih.gov/archiving/tag-library/1.1d1/n-7fz0.html)
        * [statement](https://jats.nlm.nih.gov/archiving/tag-library/1.1d1/n-sdp0.html)
            * ~~[label](https://jats.nlm.nih.gov/archiving/tag-library/1.1d1/n-sqf0.html)~~ → merge with `title`
            * [title](https://jats.nlm.nih.gov/archiving/tag-library/1.1d1/n-7fz0.html)
        * [sub](https://jats.nlm.nih.gov/archiving/tag-library/1.1d1/n-9zq0.html)
        * [sup](https://jats.nlm.nih.gov/archiving/tag-library/1.1d1/n-5zb0.html)
        * [xref](https://jats.nlm.nih.gov/archiving/tag-library/0.4/n-gnb0.html)
    * [back](https://jats.nlm.nih.gov/archiving/tag-library/1.1d1/n-2450.html)
        * [ref-list](https://jats.nlm.nih.gov/archiving/tag-library/1.1d1/n-g2i0.html)
            * ~~[label](https://jats.nlm.nih.gov/archiving/tag-library/1.1d1/n-sqf0.html)~~ → merge with `title`
            * [title](https://jats.nlm.nih.gov/archiving/tag-library/1.1d1/n-7fz0.html)
            * [ref](https://jats.nlm.nih.gov/archiving/tag-library/1.1d1/n-2mh0.html)
                * ~~element-citation~~ → rename to `citation`
                * ~~mixed-citation~~ → rename to `citation`
                * citation
                    * article-title
                    * name
                    * collab
                    * day
                    * month
                    * year
                    * fpage
                    * lpage
                    * issue
                    * pub-id
                    * publisher-loc
                    * publisher-name
                    * source
                    * edition
                    * volume
    * [floats-group](https://jats.nlm.nih.gov/archiving/tag-library/1.1d1/n-44s0.html)
        * [boxed-text](https://jats.nlm.nih.gov/archiving/tag-library/1.1d1/n-i950.html)
            * [label](https://jats.nlm.nih.gov/archiving/tag-library/1.1d1/n-sqf0.html)
            * [caption](https://jats.nlm.nih.gov/archiving/tag-library/1.1d1/n-d580.html)
                * ~~[title](https://jats.nlm.nih.gov/archiving/tag-library/1.1d1/n-7fz0.html)~~ → merge with `caption`
                * ~~[p](https://jats.nlm.nih.gov/archiving/tag-library/1.1d1/n-7xd0.html)~~ → merge with `caption`
        * [fig](https://jats.nlm.nih.gov/archiving/tag-library/1.1d1/n-ib40.html)
            * [label](https://jats.nlm.nih.gov/archiving/tag-library/1.1d1/n-sqf0.html)
            * [caption](https://jats.nlm.nih.gov/archiving/tag-library/1.1d1/n-d580.html)
                * ~~[title](https://jats.nlm.nih.gov/archiving/tag-library/1.1d1/n-7fz0.html)~~ → merge with `caption`
                * ~~[p](https://jats.nlm.nih.gov/archiving/tag-library/1.1d1/n-7xd0.html)~~ → merge with `caption`
        * [fig-group](https://jats.nlm.nih.gov/archiving/tag-library/1.1d1/n-83s0.html)
            * [label](https://jats.nlm.nih.gov/archiving/tag-library/1.1d1/n-sqf0.html)
            * [caption](https://jats.nlm.nih.gov/archiving/tag-library/1.1d1/n-d580.html)
                * ~~[title](https://jats.nlm.nih.gov/archiving/tag-library/1.1d1/n-7fz0.html)~~ → merge with `caption`
                * ~~[p](https://jats.nlm.nih.gov/archiving/tag-library/1.1d1/n-7xd0.html)~~ → merge with `caption`
            * [fig](https://jats.nlm.nih.gov/archiving/tag-library/1.1d1/n-ib40.html)
        * [table](https://jats.nlm.nih.gov/archiving/tag-library/1.1d1/n-by90.html)
            * [thead](https://jats.nlm.nih.gov/archiving/tag-library/1.1d1/n-u7z0.html)
                * [tr](https://jats.nlm.nih.gov/archiving/tag-library/1.1d1/n-jyz0.html)
                    * [th](https://jats.nlm.nih.gov/archiving/tag-library/1.1d1/n-cuz0.html)
                    * [td](https://jats.nlm.nih.gov/archiving/tag-library/1.1d1/n-tsm0.html)
            * [tbody](https://jats.nlm.nih.gov/archiving/tag-library/1.1d1/n-g4m0.html)
                * [tr](https://jats.nlm.nih.gov/archiving/tag-library/1.1d1/n-jyz0.html)
                    * [th](https://jats.nlm.nih.gov/archiving/tag-library/1.1d1/n-cuz0.html)
                    * [td](https://jats.nlm.nih.gov/archiving/tag-library/1.1d1/n-tsm0.html)
            * [tfoot](https://jats.nlm.nih.gov/archiving/tag-library/1.1d1/n-8az0.html)
                * [tr](https://jats.nlm.nih.gov/archiving/tag-library/1.1d1/n-jyz0.html)
                    * [th](https://jats.nlm.nih.gov/archiving/tag-library/1.1d1/n-cuz0.html)
                    * [td](https://jats.nlm.nih.gov/archiving/tag-library/1.1d1/n-tsm0.html)
            * [tr](https://jats.nlm.nih.gov/archiving/tag-library/1.1d1/n-jyz0.html)
                * [th](https://jats.nlm.nih.gov/archiving/tag-library/1.1d1/n-cuz0.html)
                * [td](https://jats.nlm.nih.gov/archiving/tag-library/1.1d1/n-tsm0.html)
        * [table-wrap](https://jats.nlm.nih.gov/archiving/tag-library/1.1d1/n-mb90.html)
            * [label](https://jats.nlm.nih.gov/archiving/tag-library/1.1d1/n-sqf0.html)
            * [caption](https://jats.nlm.nih.gov/archiving/tag-library/1.1d1/n-d580.html)
                * ~~[title](https://jats.nlm.nih.gov/archiving/tag-library/1.1d1/n-7fz0.html)~~ → merge with `caption`
                * ~~[p](https://jats.nlm.nih.gov/archiving/tag-library/1.1d1/n-7xd0.html)~~ -> merge with `caption`
            * table
        * [table-wrap-group](https://jats.nlm.nih.gov/archiving/tag-library/1.1d1/n-c5m0.html)
            * [label](https://jats.nlm.nih.gov/archiving/tag-library/1.1d1/n-sqf0.html)
            * [caption](https://jats.nlm.nih.gov/archiving/tag-library/1.1d1/n-d580.html)
                * ~~[title](https://jats.nlm.nih.gov/archiving/tag-library/1.1d1/n-7fz0.html)~~ → merge with `caption`
                * ~~[p](https://jats.nlm.nih.gov/archiving/tag-library/1.1d1/n-7xd0.html)~~ -> merge with `caption`
