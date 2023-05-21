-- Filename: CustomerOrder&ProductApplication-TestData
-- Authors: Jiebo Peng, Lilin Zeng, Si Wang
-- Description: The TestData section is to populate the database

-- Populate the customer table
INSERT INTO customer (name,shipping_address,mailing_address,phone_number_1,phone_number_2,credit_limit,discount)
VALUES
  ("Jack Rhodes","7830 Quam St.","4724 Sed Road","1-338-117-3475","(321) 604-2310",4,9),
  ("Henry Knight","327-4015 Ac St.","561-9058 In Road","(658) 553-7831","1-287-776-3945",2,8),
  ("Oren Holt","Ap #830-9731 Sed Rd.","743-5021 Nunc, Avenue","1-750-517-2848","1-518-759-7237",7,14),
  ("Desiree Best","Ap #493-5211 Duis Road","P.O. Box 909, 3780 Non Ave","1-233-227-6074","1-352-122-0218",3,5),
  ("Nina Fowler","794-7166 In, Rd.","125-6137 Tincidunt Street","(713) 394-6430","1-282-345-5713",9,18),
  ("Norman Mayo","6301 Nunc Av.","1117 Cursus. St.","1-695-321-7259","(941) 273-6795",7,4),
  ("Kimberley Gibson","469-2945 Sociis Road","573-7999 Amet Rd.","(891) 741-5315","1-442-247-8367",8,6),
  ("Quail Wynn","5960 Aliquam Ave","389-3209 Tincidunt Street","1-416-582-1123","(856) 522-2499",2,20),
  ("Brianna Hill","194-1338 Ipsum Street","Ap #354-7447 Nam St.","(607) 456-5560","1-585-373-6694",5,14),
  ("Lee Vang","P.O. Box 807, 4389 Habitant Ave","266 In Ave","1-473-611-5358","(457) 325-7428",4,5);

-- Populate the order table
INSERT INTO `order` (order_number,date,qty,amount_filled,amount_backordered,customer_id)
VALUES
  ("16381930","2022-10-16",23,5,18,1),
  ("11771931","2022-11-10",19,4,15,2),
  ("9614724","2022-10-15",14,2,12,3),
  ("34815248","2022-10-12",17,3,14,4),
  ("9844567","2022-09-29",17,6,11,5),
  ("48365401","2022-11-03",17,3,14,6),
  ("40151182","2022-11-18",15,2,13,7),
  ("26675674","2022-10-09",22,8,14,8),
  ("5919861","2022-10-22",15,3,12,9),
  ("3943937","2022-11-18",15,1,14,10),
  ("3967849","2022-11-18",28,14,14,4),
  ("3943796","2022-10-16",30,16,14,7),
  ("39492837","2022-09-27",32,13,19,1);

-- Populate the product table
INSERT INTO product (code,description,price,qty_on_hand,qty_back_ordered)
VALUES
  ("GBV73JSG8CU","Nam interdum enim",370,9,18),
  ("HWY45BNC4TT","Vivamus nibh dolor,",5452,4,18),
  ("MIS87LRE6SY","ut lacus. Nulla",2943,8,16),
  ("LJD40QMY5KO","Cras interdum. Nunc",2363,4,10),
  ("WRL35SBO7OY","vestibulum lorem, sit",8729,9,13),
  ("XTY13YWN5CX","imperdiet non, vestibulum",1194,8,17),
  ("XLI10LNT0XD","magna et ipsum",1369,14,17),
  ("NZC47MPN2RU","Integer eu lacus.",5495,2,20),
  ("VBG74LIO2KT","malesuada. Integer id",3182,9,15),
  ("WSY62OCQ2UO","Aliquam tincidunt, nunc",2895,12,12);

-- Populate the part table
INSERT INTO part (part_numb,description,inventory)
VALUES
  ("DIZ11QFC1HP","vestibulum, neque sed",12),
  ("KRN85XWX1JY","luctus et ultrices",15),
  ("YBX02GBN2SE","porttitor interdum. Sed",17),
  ("CLP05DPH0WX","felis eget varius",2),
  ("GYZ46IHM8WM","id, libero. Donec",1),
  ("EVH12MWF5XF","suscipit nonummy. Fusce",13),
  ("XXF01BUE3FH","molestie tellus. Aenean",7),
  ("YMO73KQJ6KY","Sed congue, elit",7),
  ("WYJ44ZPW1BG","mi pede, nonummy",5),
  ("FBS23NXH3OS","tortor nibh sit",8);

-- Populate the product_has_part table
INSERT INTO product_has_part (product_code,part_part_numb)
VALUES
  ("GBV73JSG8CU","DIZ11QFC1HP"),
  ("HWY45BNC4TT","KRN85XWX1JY"),
  ("MIS87LRE6SY","YBX02GBN2SE"),
  ("LJD40QMY5KO","CLP05DPH0WX"),
  ("WRL35SBO7OY","GYZ46IHM8WM"),
  ("XTY13YWN5CX","EVH12MWF5XF"),
  ("XLI10LNT0XD","XXF01BUE3FH"),
  ("NZC47MPN2RU","YMO73KQJ6KY"),
  ("VBG74LIO2KT","WYJ44ZPW1BG"),
  ("WSY62OCQ2UO","FBS23NXH3OS");

-- Populate the order_has_product table 
INSERT INTO order_has_product(order_order_number, product_code)
VALUES
("16381930","GBV73JSG8CU"),
("11771931","HWY45BNC4TT"),
("9614724","MIS87LRE6SY"),
("34815248","LJD40QMY5KO"),
("9844567","WRL35SBO7OY"),
("48365401","XTY13YWN5CX"),
("40151182","XLI10LNT0XD"),
("26675674","NZC47MPN2RU"),
("5919861","VBG74LIO2KT"),
("3943937","WSY62OCQ2UO"),
("3967849","XLI10LNT0XD"),
("3943796","HWY45BNC4TT"),
("39492837","LJD40QMY5KO"),
("9844567","MIS87LRE6SY"),
("16381930","XTY13YWN5CX");