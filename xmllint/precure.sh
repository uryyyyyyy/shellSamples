curl -Lso- goo.gl/AqZuEg | sed 's|</a>|\n&|g' | xmllint --xpath '//*[@id="mw-content-text"]/table[4]/*/td[1]/a/text()' --html - | nl
