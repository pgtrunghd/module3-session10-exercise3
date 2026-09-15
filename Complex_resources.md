# [Bài tập 3] Xử lý tài nguyên phức tạp (Complex Resources)

## Danh sách Endpoint cho tài nguyên có quan hệ Cha - Con (Parent-Child)

### 1. Lấy tất cả lịch hẹn của một bác sĩ cụ thể (theo doctorId)
* **HTTP Method:** `GET`
* **Endpoint:** `/api/v1/doctors/{doctorId}/appointments`
* **Mô tả:** Trả về danh sách tất cả lịch hẹn khám thuộc về bác sĩ có mã `{doctorId}`.
* **Cấu trúc URL:** `/doctors/{doctorId}/appointments`

---

### 2. Lấy một đơn thuốc cụ thể của một bệnh nhân cụ thể
* **HTTP Method:** `GET`
* **Endpoint:** `/api/v1/patients/{patientId}/prescriptions/{prescriptionId}`
* **Mô tả:** Trả về thông tin chi tiết của đơn thuốc có mã `{prescriptionId}` thuộc về bệnh nhân có mã `{patientId}`.
* **Cấu trúc URL:** `/patients/{patientId}/prescriptions/{prescriptionId}`

---

### 3. Thêm một đơn thuốc mới cho bệnh nhân
* **HTTP Method:** `POST`
* **Endpoint:** `/api/v1/patients/{patientId}/prescriptions`
* **Mô tả:** Tạo mới một đơn thuốc gán cho bệnh nhân có mã `{patientId}` (Dữ liệu đơn thuốc gửi kèm trong Request Body).
* **Cấu trúc URL:** `/patients/{patientId}/prescriptions`

---

## Giải thích Quy tắc Tuân thủ

* **Quan hệ Phân cấp (Parent-Child Hierarchy):** Cấu trúc đường dẫn phản ánh mối quan hệ sở hữu giữa đối tượng cha (Doctor, Patient) và đối tượng con (Appointment, Prescription).
* **Cấu trúc chuẩn:** Dùng `/resource/{id}/sub-resource` để truy xuất tài nguyên con trong ngữ cảnh của tài nguyên cha.
* **HTTP Method linh hoạt:** Sử dụng `GET` để lấy thông tin và `POST` trên endpoint của tài nguyên con để khởi tạo một bản ghi mới trực thuộc tài nguyên cha.