# UI lab results

Tool parts that I chose: Part 3 (Robot Framework) and Part 4 (Cypress)

## Part 0
- Step 0.1, Chrome version: 157.0.8103.38 (Official Build) (64-bit) (cohort: 157.0.8103.38 Rollout) 
- Step 0.3, ChromeDriver version: ChromeDriver 157.0.8103.38 (a733b5afbb3ba618844ff8876b89ad1a774b2f18-refs/branch-heads/8103@{#1034})
- Step 0.4, locator of Pizza, Please!: button[name='pizza-please']
- Step 0.4, locator of Excluded tools: css=select
- Step 0.4, locator of Must be vegetarian: id=default-checkbox
- Step 0.4, locator of Custom Pizza Name: input#pizza-name
- Step 0.5, pizza name, tool and calories of the run by hand: Lab Pizza 20261106-201500, Scissors, 480 calories

| Step | Actual result | Pass or fail |
|------|---------------|--------------|
| 1 | The heading reads Looking to break out of your pizza routine? | Pass |
| 2 | Max Calories per Slice, Excluded tools, Must be vegetarian and Custom Pizza Name appear | Pass |
| 3 | The fields show 600, Knife selected, vegetarian checked, Lab Pizza 20261106-201500 | Pass |
| 4 | Pizza name shows Lab Pizza 20261106-201500, Tool shows Scissors (not Knife), calories 480 (<= 600) | Pass |
| 5 | The page shows message Please log in first. | Pass |
| 6 | Navigated to /admin, signed in with admin/admin, page displays Latest pizza recommendations | Pass |
| 7 | Found pizza Lab Pizza 20261106-201500 in list with tool Scissors | Pass |


## Part 3: Robot Framework
- robot --version: Robot Framework 7.5.1 (Python 3.13.11 on win32)
- Step 3.2, failure message for the wrong title: Title should have been 'Web Form' but was 'Web form'
- Step 3.8, run 1, result, elapsed time and pizza name: Pass, 13s
- Step 3.8, run 2, result, elapsed time and pizza name: Pass, 16s


## Part 4: Cypress
- node --version, npm --version and npx cypress version: node v22.20.0, npm 10.9.3, Cypress package 16.2.1 (binary 16.2.1)
- Step 4.3, failure message for the wrong title: Timed out retrying after 10000ms: expected 'Web form' to equal 'Web Form'
- Step 4.6, tool and calories in the answer of POST /api/pizza: Scissors, 325
- Step 4.7, the line of the admin list that shows your pizza: Lab Pizza 20261106-203935 (tool=Scissors, ingredients_number=6)
- Step 4.8, run 1, result, duration and pizza name: Pass, 00:17, Lab Pizza 20261106-204314
- Step 4.8, run 2, result, duration and pizza name: Pass, 00:23, Lab Pizza 20261106-204433
- Step 4.9 (optional), browser and result: Microsoft Edge 156, both specs passed (All specs passed! 00:17)

## Part B
1. เมื่อเปิดดูโครงสร้างหน้าเว็บจะพบว่า กล่องกรอกตัวเลขทั้ง 3 ช่องใช้ `id="floating_filled"` ซ้ำกันทั้งหมด ซึ่งผิดมาตรฐาน HTML ที่ id ต้องไม่ซ้ำกัน การระบุผ่าน id ตรง ๆ จึงเกิดความคลุมเครือ เราจึงต้องระบุตำแหน่งผ่านข้อความของ `<label>` ที่มีข้อความเฉพาะเจาะจงแทน หากต้องการแก้หน้าเว็บให้ถูกต้อง ควรตั้ง id ให้ไม่ซ้ำกันและสื่อความหมาย เช่น `id="max-calories"` การแก้ไขนี้จะช่วยให้คนเขียนเทสต์สามารถใช้ชื่ออ้างอิงสั้น ๆ อย่าง `#max-calories` ได้โดยตรง ไม่ต้องเขียนค้นหาตำแหน่งที่ซับซ้อนและเสี่ยงพังง่ายเวลาโครงสร้างหน้าเว็บเปลี่ยน

2. การนำอุปกรณ์ที่แสดงในหน้ารายการแอดมินไปเทียบกับอุปกรณ์ที่ลูกค้าได้รับ เป็นการตรวจสอบความสอดคล้องของข้อมูลข้ามระบบ เพื่อยืนยันว่าทุกมุมมองแสดงผลข้อมูลชุดเดียวกันจริง การตรวจสอบแบบนี้ช่วยดักจับข้อผิดพลาดเรื่องการบันทึกข้อมูลลงฐานข้อมูล เช่น ระบบสุ่มและแสดงผลบนหน้าเว็บลูกค้าได้ถูกต้อง แต่กลับไม่ได้บันทึกหรือบันทึกผิดพลาดลงฐานข้อมูล ทำให้หน้าต่างแอดมินแสดงข้อมูลไม่ตรงกัน

3. ตัวเทสต์ไม่ได้เช็คเพราะหน้าเว็บ QuickPizza ไม่ได้มีข้อความบอกตรง ๆ ว่าเป็นมังสวิรัติหรือไม่ แต่แสดงเป็นรายการส่วนผสมออกมาแทน หากต้องการเขียนเทสต์ตรวจเช็คอัตโนมัติ สามารถทำได้ 2 วิธี คือ ข้อ 1 เขียนฟังก์ชันตรวจสอบรายชื่อส่วนผสมในหน้าเว็บว่าไม่มีเนื้อสัตว์ปนอยู่เลย หรือ ข้อ 2 ดักจับข้อมูลที่ตอบกลับมาจากเซิร์ฟเวอร์ โดยใช้ `cy.intercept` ใน Cypress เพื่อตรวจเช็คค่า `"vegetarian": true` ในข้อมูลที่เซิร์ฟเวอร์ส่งกลับมา

4. ด้านการรอองค์ประกอบ Robot Framework ต้องคอยใส่คำสั่งรออย่างเจาะจง เช่น `Wait Until Element Is Visible` ขณะที่ Cypress มีระบบช่วยรอและลองใหม่ให้อัตโนมัติ ทำให้ไม่ต้องเขียนคำสั่งรอพร่ำเพรื่อ ด้านการเขียน Robot Framework รู้สึกเหมือนเขียนประโยคภาษาอังกฤษแบบเป็นคำสั่งเข้าใจง่าย ส่วน Cypress ใช้ภาษา JavaScript ที่เขียนเชื่อมคำสั่งกันได้ลื่นไหลและจัดการเงื่อนไขที่ซับซ้อนได้สะดวกกว่า ด้านรายงานผล Robot Framework ให้รายงาน HTML ที่แยกรายละเอียดแต่ละขั้นตอนอ่านง่าย ส่วน Cypress โดดเด่นเรื่องการบันทึกวิดีโอและการเปิดดูสถานะหน้าเว็บย้อนหลังทีละคำสั่งได้

5. สำหรับ Project 2 เลือกใช้ Cypress ด้วยเหตุผล 2 ข้อ: ข้อ 1 Cypress มีระบบรอและลองใหม่ให้อัตโนมัติ ช่วยลดปัญหาการทดสอบติด ๆ ดับ ๆ บนหน้าเว็บยุคใหม่ได้อย่างมีประสิทธิภาพ ข้อ 2 Cypress มีเครื่องมือช่วยหาจุดบกพร่องที่สะดวกมาก เช่น การดักจับข้อมูล API ด้วย `cy.intercept` และการดูหน้าเว็บย้อนหลังทีละขั้นตอน ทำให้หาสาเหตุของปัญหาและแก้ไขเทสต์ได้อย่างรวดเร็ว

6. ต้องแก้ไขเพียงไฟล์เดียวคือ `robot/resources/quickpizza.resource` ตรงตัวแปร `${MAX CALORIES}` ให้เป็นตำแหน่งใหม่ สาเหตุเพราะเราแยกโครงสร้างการทำงานโดยเก็บตำแหน่งขององค์ประกอบทั้งหมดไว้ในไฟล์ Resource แล้วสร้างเป็น Keyword ให้ไฟล์เทสต์หลักเรียกใช้ ทำให้เมื่อโครงสร้างหน้าเว็บเปลี่ยน จึงแก้ที่ไฟล์ Resource เพียงจุดเดียว โดยไม่ต้องแก้ไฟล์ `pizza_scenario.robot` เลย

7. ไม่สามารถแยกเป็น 2 เทสต์ย่อยได้เพราะ Cypress มีระบบแยกการทำงานของการทดสอบ ซึ่งจะล้างคุกกี้และข้อมูลเซสชันทิ้งโดยอัตโนมัติก่อนเริ่มรันแต่ละบล็อก `it` QuickPizza ทำงานอยู่บนเซิร์ฟเวอร์หลายตัวพร้อมกัน และต้องใช้คุกกี้ในการจำว่าเบราว์เซอร์นี้กำลังคุยกับเซิร์ฟเวอร์เครื่องไหนที่มีข้อมูลพิซซ่าที่เพิ่งสั่งไป หากแยกเทสต์ คุกกี้จะถูกลบ ทำให้หน้าแอดมินเชื่อมต่อไปยังเซิร์ฟเวอร์คนละเครื่องและไม่พบข้อมูลพิซซ่าที่เราเพิ่งสร้างไว้ในขั้นตอนก่อนหน้า
