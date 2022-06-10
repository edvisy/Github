insert into InterfaceLookUp (interface_name, [key], [value]) values
('LGX.Amazon.XPath', 'ponumber', '//body/div[@id=''header''][1]/table[@id=''order_lines'']/tr/td[1]/text()')
,('LGX.Amazon.XPath', 'deliveryaddress', '//body/div[@id=''header''][1]/table[@id=''order_lines''][2]/tr/td[1]/div[1]/text()')
,('LGX.Amazon.XPath', 'podate', '//body/div[@id=''header''][3]/table[@id=''order_lines'']/tr/td[1]/text()')
,('LGX.Amazon.XPath', 'paymentterms', '//body/div[@id=''header''][3]/table[@id=''order_lines'']/tr/td[3]/text()')
,('LGX.Amazon.XPath', 'lineno', '//body/div[@id=''header''][7]/table[@id=''order_lines'']/tr[{0}]/td[1]/text()')
,('LGX.Amazon.XPath', 'matdesc', '//body/div[@id=''header''][7]/table[@id=''order_lines'']/tr[{0}]/td[2]/text()')
,('LGX.Amazon.XPath', 'deliverydate', '//body/div[@id=''header''][7]/table[@id=''order_lines'']/tr[{0}]/td[3]/text()')
,('LGX.Amazon.XPath', 'quantity', '//body/div[@id=''header''][7]/table[@id=''order_lines'']/tr[{0}]/td[4]/text()')
,('LGX.Amazon.XPath', 'uom', '//body/div[@id=''header''][7]/table[@id=''order_lines'']/tr[{0}]/td[5]/text()')
,('LGX.Amazon.XPath', 'unitprice', '//body/div[@id=''header''][7]/table[@id=''order_lines'']/tr[{0}]/td[6]/span/text()')
,('LGX.Amazon.XPath', 'unittotal', '//body/div[@id=''header''][7]/table[@id=''order_lines'']/tr[{0}]/td[7]/span/text()')
,('LGX.Amazon.XPath', 'unitcount', 'count(//body/div[@id=''header''][7]/table[@id=''order_lines'']/tr)')
,('LGX.Amazon.XPath', 'quantitytotal', 'sum(//body/div[@id=''header''][7]/table[@id=''order_lines'']/tr/td[4])')

-- delete from InterfaceLookUp where interface_name = 'LGX.Amazon.XPath'

