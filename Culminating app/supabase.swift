
//
//  Supabase.swift, .swift
//  TodoList
//
//  Created by Gray Clark on 2024-05-23.
//

import Foundation
import Supabase

let supabase = SupabaseClient(
  supabaseURL: URL(string: "https://vzkfshhlmzrqdmepfrju.supabase.co")!,
  supabaseKey: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InZ6a2ZzaGhsbXpycWRtZXBmcmp1Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTc2ODg2MzIsImV4cCI6MjAzMzI2NDYzMn0.mFPhim5z9oN8Z_e2O39uUXILPAOi61-FTbiWK50iyjU"
)
