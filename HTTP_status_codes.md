# [Bài tập 2] Chuẩn hóa mã lỗi HTTP (HTTP Status Codes)

## Giải thích và lựa chọn HTTP Status Code cho các tình huống

### TH1: Người dùng gửi yêu cầu đặt lịch khám nhưng bỏ trống tên bệnh nhân.
* **HTTP Status Code:** `400 Bad Request`
* **Lý do:** Yêu cầu do client gửi lên vi phạm quy tắc validation (thiếu trường dữ liệu bắt buộc `patient_name`). Đây là lỗi cú pháp/dữ liệu đầu vào từ phía người dùng, server không thể xử lý yêu cầu nếu thiếu thông tin này.

---

### TH2: Tìm kiếm hồ sơ bệnh án với ID là 999 nhưng trong Database không tồn tại.
* **HTTP Status Code:** `404 Not Found`
* **Lý do:** URI/Tài nguyên được truy vấn (`/medical-records/999`) không tồn tại trên hệ thống. Mã `404` báo cho client biết tài nguyên yêu cầu không tìm thấy trong CSDL.

---

### TH3: Hệ thống đang chạy thì Database MySQL bị sập, không thể truy vấn dữ liệu.
* **HTTP Status Code:** `500 Internal Server Error`
* **Lý do:** Đây là lỗi phát sinh từ phía máy chủ (Server-side error). Client gửi yêu cầu hợp lệ nhưng server gặp sự cố kỹ thuật không mong muốn (mất kết nối CSDL) khiến tiến trình xử lý bị gián đoạn.

---

### TH4: Người dùng nhập tuổi bệnh nhân là -5 (Dữ liệu không hợp lệ về mặt logic).
* **HTTP Status Code:** `400 Bad Request` *(hoặc `422 Unprocessable Entity`)*
* **Lý do:** 
  * `400 Bad Request`: Được sử dụng phổ biến khi dữ liệu đầu vào vi phạm business logic/validation (tuổi không thể là số âm).
  * `422 Unprocessable Entity`: Chuẩn RESTful nâng cao thường dùng mã này khi định dạng request đúng (JSON hợp lệ) nhưng nội dung dữ liệu bên trong bị sai logic thương vụ (semantic error).