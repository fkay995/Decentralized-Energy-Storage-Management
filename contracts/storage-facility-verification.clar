;; Storage Facility Verification Contract
;; Validates and tracks battery installations

(define-data-var admin principal tx-sender)

;; Facility status: 0 = pending, 1 = approved, 2 = rejected
(define-map facilities
  { facility-id: uint }
  {
    owner: principal,
    capacity: uint,
    location: (string-utf8 100),
    status: uint,
    timestamp: uint
  }
)

(define-data-var next-facility-id uint u1)

;; Register a new battery facility
(define-public (register-facility (capacity uint) (location (string-utf8 100)))
  (let
    ((facility-id (var-get next-facility-id)))
    (begin
      (map-set facilities
        { facility-id: facility-id }
        {
          owner: tx-sender,
          capacity: capacity,
          location: location,
          status: u0,  ;; pending by default
          timestamp: block-height
        }
      )
      (var-set next-facility-id (+ facility-id u1))
      (ok facility-id)
    )
  )
)

;; Approve a facility (admin only)
(define-public (approve-facility (facility-id uint))
  (begin
    (asserts! (is-eq tx-sender (var-get admin)) (err u403))
    (match (map-get? facilities { facility-id: facility-id })
      facility (begin
        (map-set facilities
          { facility-id: facility-id }
          (merge facility { status: u1 })
        )
        (ok true)
      )
      (err u404)
    )
  )
)

;; Reject a facility (admin only)
(define-public (reject-facility (facility-id uint))
  (begin
    (asserts! (is-eq tx-sender (var-get admin)) (err u403))
    (match (map-get? facilities { facility-id: facility-id })
      facility (begin
        (map-set facilities
          { facility-id: facility-id }
          (merge facility { status: u2 })
        )
        (ok true)
      )
      (err u404)
    )
  )
)

;; Get facility details
(define-read-only (get-facility (facility-id uint))
  (map-get? facilities { facility-id: facility-id })
)

;; Check if a facility is approved
(define-read-only (is-facility-approved (facility-id uint))
  (match (map-get? facilities { facility-id: facility-id })
    facility (is-eq (get status facility) u1)
    false
  )
)

;; Transfer admin rights (admin only)
(define-public (set-admin (new-admin principal))
  (begin
    (asserts! (is-eq tx-sender (var-get admin)) (err u403))
    (var-set admin new-admin)
    (ok true)
  )
)
